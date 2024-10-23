# spec/rails_helper.rb
require 'spec_helper'
require 'factory_bot_rails'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'devise'  # Add Devise for testing helpers

# Additional requires, add any other support files here
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Ensure ActiveRecord migrations are up to date
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
  # Include Devise test helpers in request specs
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include FactoryBot::Syntax::Methods
  # Filter Rails gems from backtraces.
  config.filter_rails_from_backtrace!
end

