# service for doing calculations/updates related to a user's calories log
class UserCalories
  attr_reader :user

  def initialize(user)
    @user = user
  end

  # Get the user's calorie balance.
  # If no date is given, it is the user's all-time balance.
  # If date is passed, it is only the balance earned on that day.
  def calorie_balance(date = nil, exclude_burritos = false)
    scope = user.calorie_logs
    (scope = scope.where(fitbit_date: date)) if date
    if exclude_burritos
      # TODO: change to track calorie log source. this is a hack!
      scope.select { |c| c.burrito.nil? }.sum(&:calories)
    else
      scope.calorie_balance
    end
  end

  # last date we have calorie data for, or today if there is no calorie date
  def last_known_calorie_date
    last_date = user.calorie_logs.maximum(:fitbit_date)
    (last_date || today_in_user_tz)
  end

  # dates we should fetch data for
  def dates_needing_data
    today = today_in_user_tz
    last_known = last_known_calorie_date
    dates = [last_known]
    while dates.last < today
      dates << dates.last.tomorrow
    end
    dates
  end

  def today_in_user_tz
    (Time.now.utc + user.fitbit_timezone.utc_offset.seconds).to_date
  end

  # true if the user has enough calories for a burrito
  def burrito_earned?
    calorie_balance >= Burrito::CALORIES
  end

  # Creates a Burrito
  def earn_burrito!
    user.burritos.create!(
      calorie_log: CalorieLog.create!(
        user: user,
        calories: (0 - Burrito::CALORIES),
        fitbit_date: today_in_user_tz
      )
    )
    if user.ios_device_tokens.any?
      ZeroPush.notify({
        device_tokens: user.ios_device_tokens.map(&:token),
        alert: 'Burrito Time!',
        sound: 'default'
      })
    end
  end
end
