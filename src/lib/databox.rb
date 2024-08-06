=begin
#Static OpenAPI document of Push API resource

#Push API resources Open API documentation

The version of the OpenAPI document: 0.4.3

Generated by: https://openapi-generator.tech
Generator version: 7.6.0

=end

# Common files
require 'databox/api_client'
require 'databox/api_error'
require 'databox/version'
require 'databox/configuration'

# Models
require 'databox/models/api_response'
require 'databox/models/push_data'
require 'databox/models/push_data_attribute'
require 'databox/models/state'

# APIs
require 'databox/api/default_api'

module Databox
  class << self
    # Customize default settings for the SDK using block.
    #   Databox.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
