require 'httparty'
require 'json'

class Databox::Client
  include HTTParty
  format :json
  headers 'User-Agent' => "Databox/#{Databox::VERSION} (Ruby)"
  debug_output if [1, "1"].include?(ENV["HTTPARTY_DEBUG"])
  default_timeout 1 if ENV["DATABOX_MODE"] == "test"

  def initialize
    Databox.configure unless Databox.configured?

    self.class.base_uri push_host
    self.class.basic_auth push_token, ''
    self.class.headers 'Content-Type' => 'application/json'
    self
  end

  def push_host
    Databox.configuration.push_host
  end

  def push_token
    Databox.configuration.push_token
  end

  def raw_push(path='/', data=nil)
    self.class.post(path, data.nil? ? {} : JSON.dump({data: data}))
  end

  def push(key, value, date=nil)

  end

  def insert_all(rows=[])

  end

  def last_push
    raw_push '/lastpushes/1'
  end
end

=begin

  def push(data={})
    if validate data
      data = [data] unless data.is_a?(Array)
      handle self.class.post("/push/custom/#{self.token}", body: { data: data }.to_json)
    end
  end

  def handle(response)
    if response.code > 201
      raise Databox::ClientError.new(
        response.code.to_s+" - "+
        response.parsed_response["error"]["type"]+" - "+
        response.parsed_response["error"]["message"]
      )
    end

    output = response.parsed_response

    if output.is_a?(Hash) and output.keys.include?("response")
      Databox::Response.new(output["response"])
    elsif output.is_a?(Array)
      output.map { |item| Databox::Response.new(item) }
    else
      output
    end
  end

  def validate(data)
    return data.map do |dp|
      validate(dp)
    end if data.is_a?(Array)

    errors = []
    errors.push("Data is missing") if data.nil? or data == {}
    errors.push("Key is required") if data[:key].nil?
    # errors.push("Value is required") if data[:value].nil?

    errors.push("Date format is invalid") if not(data[:date].nil?) and (Date.iso8601(data[:date]) rescue false) == false
    errors.push("Key format is invalid") unless data[:key] =~/^[a-zA-Z0-9_\.\@]*$/

    unless errors.empty?
      invalid_record = Databox::InvalidRecord.new "Payload is invalid"
      invalid_record.errors = errors
      raise invalid_record
    end

    true
  end
end

class Databox::InvalidRecord < StandardError
  attr_accessor :errors
end

class Databox::ClientError < StandardError; end

class Databox::Response < OpenStruct
  def success?
    self.type == "success"
  end
end

=end