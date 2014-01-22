class Databox::Client
  include HTTParty
  format :json
  headers "User-Agent" => "Databox/#{Databox::VERSION} (Ruby)"

  debug_output

  @@token = nil
  def self.token
    @@token
  end

  def token
    @@token
  end

  def initialize options={}
    self.class.base_uri(options[:url]) unless options[:url].nil?
    self.class.basic_auth(options[:key], "password") unless options[:key].nil?
    @@token=options[:token] unless options[:token].nil?
  end

  def self.whoami
    self
  end

  def push data={}
    handle self.class.post("/push/custom/#{self.token}", body: {
      data: data
    }.to_json)
  end

  #TODO: Error handling
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

    Databox::Response.new(response.parsed_response["response"])
  end
end

class Databox::ClientError < StandardError; end
class Databox::Response < OpenStruct; end
