ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

#if ENV['DB'] == 'postgres'
#  configs = YAML.load_file('test/database.yml')
#  ActiveRecord::Base.configurations = configs
#  ActiveRecord::Base.establish_connection(configs['test'])
#  ActiveRecord::Base.default_timezone = :utc
#end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  include Devise::TestHelpers
end