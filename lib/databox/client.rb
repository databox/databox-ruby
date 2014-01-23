class Databox::Client
  include HTTParty
  format :json
  headers "User-Agent" => "Databox/#{Databox::VERSION} (Ruby)"

  debug_output if ENV["HTTPARTY_DEBUG"] == "1"

  def token; Databox.configuration.token end
  def key; Databox.configuration.key end
  def url; Databox.configuration.url end

  def initialize
    Databox.configure unless Databox.configured?

    self.class.base_uri url
    self.class.basic_auth key, "password"
  end

  def push data={}
    handle self.class.post("/push/custom/#{self.token}",
      body: { data: data }.to_json)
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
end

class Databox::ClientError < StandardError; end
class Databox::Response < OpenStruct; end
