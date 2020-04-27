ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # include Devise::Test::IntegrationHelpers

  # Note: the following causes an error in Minitest 5.14
  # Run tests in parallel with specified workers
  # parallelize(workers: :number_of_processors) 
  # See: https://github.com/rails/rails/issues/32682
  # and https://github.com/rails/rails/issues/38424
  
  # instead, limit to 1 worker:
  parallelize(workers: 1)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
