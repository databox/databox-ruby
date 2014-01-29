require "bundler/setup"

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end

require 'pry'

# if ENV["NO_WEBMOCK"] != "1"
#   require 'webmock/rspec'
#   WebMock.disable_net_connect!(allow_localhost: false)
# end

require 'dotenv'
Dotenv.load

ENV["DATABOX_MODE"]   = "test"
ENV["DATABOX_KEY"]    ||= "8s0igg41718gos00wwc40gkokwcowk84"
ENV["DATABOX_TOKEN"]  ||= "zqa9z737mxw4ck84"

require "databox"

RSpec.configure do |config|
  config.fail_fast = ENV['RSPEC_FAIL_FAST'] == "1"
  config.mock_framework = :rspec # :mocha
  config.run_all_when_everything_filtered = true
  config.treat_symbols_as_metadata_keys_with_true_values = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

