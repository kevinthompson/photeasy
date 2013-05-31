require File.expand_path('../../config/environment', __FILE__)
require 'capybara/rspec'
require 'fakeweb'
require 'rspec/rails'
require 'spork'

Spork.prefork do
  unless ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'rails'
  end

  Dir[Rails.root.join('spec/support/**/*.rb')].each {|f| require f}
  Capybara.javascript_driver = :webkit

  RSpec.configure do |config|
    config.mock_with :rspec
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true
    config.include FactoryGirl::Syntax::Methods
    config.include Devise::TestHelpers, type: :controller
  end
end

Spork.each_run do
  if ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'rails'
  end

  FactoryGirl.reload
  RSpec.configuration.seed = srand && srand % 0xFFFF
end