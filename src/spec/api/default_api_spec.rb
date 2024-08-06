=begin
#Static OpenAPI document of Push API resource

#Push API resources Open API documentation

The version of the OpenAPI document: 0.4.3

Generated by: https://openapi-generator.tech
Generator version: 7.6.0

=end

require 'spec_helper'
require 'json'

# Unit tests for Databox::DefaultApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'DefaultApi' do
  before do
    # run before each test
    @api_instance = Databox::DefaultApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of DefaultApi' do
    it 'should create an instance of DefaultApi' do
      expect(@api_instance).to be_instance_of(Databox::DefaultApi)
    end
  end

  # unit tests for data_delete
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'data_delete test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for data_metric_key_delete
  # @param metric_key 
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'data_metric_key_delete test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for data_post
  # @param [Hash] opts the optional parameters
  # @option opts [Array<PushData>] :push_data 
  # @return [nil]
  describe 'data_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for metrickeys_get
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'metrickeys_get test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for metrickeys_post
  # @param [Hash] opts the optional parameters
  # @option opts [Object] :body 
  # @return [nil]
  describe 'metrickeys_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for ping_get
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'ping_get test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

end
