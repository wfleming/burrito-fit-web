source 'https://rubygems.org'

ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
gem 'pg'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Auth
gem 'omniauth-fitbit'

# use bootstrap & sass
gem 'sass-rails'
gem 'bootstrap-sass'

gem 'fitgem'
gem 'hirefire-resource'
gem 'rails_admin'
gem 'sidekiq'
gem 'sinatra', require: false # for sidekiq-web
gem 'zero_push'

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'foreman'
  gem 'pry-rails'
end

# Use rspec for testing
group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'envyable'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'timecop', require: false
  gem 'factory_girl_rails'
end

# Use unicorn as the app server
group :development, :deploy do
  gem 'unicorn'
end

# Use debugger
# gem 'debugger', group: [:development, :test]

group :production do
  gem 'rails_12factor'
end
