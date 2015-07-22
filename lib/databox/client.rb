require 'httparty'
require 'json'

class Databox::Client
  include HTTParty
  format :json
  headers 'User-Agent' => "Databox/#{Databox::VERSION} (Ruby)"
  debug_output if [1, "1"].include?(ENV["HTTPARTY_DEBUG"])
  default_timeout 1 if ENV["DATABOX_MODE"] == "test"

  attr_accessor :last_push_content

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

  # Sends data to actual end-point.
  def raw_push(path='/', data=nil)
    handle self.class.post(path, data.nil? ? {} : {body: JSON.dump({data: data})})
  end

  def handle(response)
    response.parsed_response
  end

  def process_kpi(options={})
    options.delete_if { |k, _| [:date, 'date'].include?(k) }

    %i{key value}.each do |k|
      raise("Missing '#{k}'") if (options[k] || options[k.to_s]).nil?
    end

    options["$#{(options['key'] || options[:key])}"] = options['value'] || options[:value]
    options.delete_if { |k, _| [:key, 'key', :value, 'value'].include?(k) }

    attributes = options[:attributes] || options['attributes']
    unless attributes.nil?
      [:attributes, 'attributes'].each {|k| options.delete(k) }
      attributes.each { |k,v| options[k] = v }
    end

    options
  end

  def push(kpi={})
    self.last_push_content = raw_push('/', [process_kpi(kpi)])
    self.last_push_content['status'] == 'ok'
  end

  def insert_all(rows=[])
    self.last_push_content = raw_push('/', rows.map {|r| process_kpi(r) })
    self.last_push_content['status'] == 'ok'
  end

  def last_push(n=1)
    raw_push "/lastpushes/#{n}"
  end
end
