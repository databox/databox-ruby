require "httparty"

module Databox
  autoload :VERSION,        "databox/version"
  autoload :Client,         "databox/client"
  autoload :Configuration,  "databox/configuration"
  autoload :Integration,    "databox/integration"

  autoload :Pipeline,       "databox/integration"
  autoload :Funnel,         "databox/integration"
  autoload :Pie,            "databox/integration"
  autoload :Progress,       "databox/integration"
  autoload :Messages,       "databox/integration"


  class << self
    attr_accessor :configuration

    def configured?
      return false if configuration.nil?
      [configuration.token, configuration.key, configuration.url].compact.size == 3
    end

    def client
      @client ||= Databox::Client.new
    end
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration if block_given?
  end

end
