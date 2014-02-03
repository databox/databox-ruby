class Databox::Client
  include HTTParty
  format :json

  headers "User-Agent" => "Databox/#{Databox::VERSION} (Ruby)"

  debug_output if ENV["HTTPARTY_DEBUG"] == "1"

  default_timeout 1 if ENV["DATABOX_MODE"] == "test"

  attr_accessor :token
  def token
    @token || Databox.configuration.token
  end

  def key; Databox.configuration.key end
  def url; Databox.configuration.url end

  def initialize
    Databox.configure unless Databox.configured?

    self.class.base_uri url
    self.class.basic_auth key, "password"
  end

  def push data={}
    if validate data
      data = [data] unless data.is_a?(Array)
      handle self.class.post("/push/custom/#{self.token}", body: { data: data }.to_json)
    end
  end

  def logs
    handle self.class.get("/push/custom/#{self.token}/logs")
  end

  def handle response
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

  def validate data
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
    self[:type] == "success"
  end
end
