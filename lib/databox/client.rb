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
    handle self.class.post(path, data.nil? ? {} : JSON.dump({data: data}))
  end

  def handle(response)
    response.parsed_response
  end

  def process_kpi(options={})
    #TODO: Implement this
  end

  def push(key, value, date=nil)
    #TODO: Implement this

  end

  def insert_all(rows=[])
    #TODO: Implement this
  end

  def last_push
    raw_push '/lastpushes/1'
  end
end