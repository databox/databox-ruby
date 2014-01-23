require "bundler/setup"

require 'pry'
#require 'webmock/rspec'
#WebMock.disable_net_connect!(allow_localhost: true)

require 'dotenv'
Dotenv.load

ENV["DATABOX_MODE"] = "test"
ENV["DATABOX_KEY"] = "566m5nap2ls88sw44g440sww08s088sc"
ENV["DATABOX_TOKEN"] = "2kw290l5m2gwgsw0"

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
