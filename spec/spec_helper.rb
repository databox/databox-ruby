require "bundler/setup"

require 'dotenv'
Dotenv.load

ENV["DATABOX_MODE"] = "test"

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
