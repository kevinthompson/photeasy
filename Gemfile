source 'https://rubygems.org'
ruby '2.0.0'

# Platform
gem 'active_model_serializers', '~> 0.8.0'
gem 'activeadmin'
gem 'aws-sdk'
gem 'dalli'
gem 'dropbox-api'
gem 'figaro'
gem 'foreman'
gem 'high_voltage'
gem 'jbuilder'
gem 'memcachier'
gem 'pg'
gem 'pusher'
gem 'raddocs', git: 'git://github.com/kevinthompson/raddocs.git'
gem 'rails', '3.2.13'
gem 'sentry-raven'
gem 'strong_parameters'
gem 'unicorn'
gem 'uuidtools'

# Monitoring/Analytics
gem 'newrelic_rpm'
gem 'rack-google-analytics'

# Background Jobs
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'sinatra', '>= 1.3.0', :require => nil
gem 'slim', '>= 1.3.0'

# Email
gem 'gibbon'
gem 'mandrill-api'
gem 'mandrill-rails'

# Authentication
gem 'devise'
gem 'devise-async'
gem 'omniauth'
gem 'omniauth-dropbox'

# File Management
gem 'paperclip'

# Order Processing
gem 'stripe'

# User Interface
gem 'haml'
gem 'simple_form'
gem 'uglifier'

group :assets do
  gem 'jquery-rails'
  gem 'coffee-rails'
  gem 'sass-rails'
  gem 'susy'
  gem 'compass-rails'
  gem 'compass-susy-plugin', require: 'susy'
end

group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'fakeweb'
  gem 'faker'
  gem 'factory_girl_rails', '~> 4.0.0'
  gem 'guard'
  gem 'guard-spork'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'mailcatcher'
  gem 'meta_request'
  gem 'pry-rails'
  gem 'quiet_assets'
  gem 'rb-fsevent'
  gem 'rspec_api_documentation', git: 'git://github.com/kevinthompson/rspec_api_documentation.git'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'watchr'
end

group :test do
  gem 'capybara-webkit'
  gem 'timecop'
  gem 'fakeredis', require: 'fakeredis/rspec'
  gem 'simplecov', require: false
end
