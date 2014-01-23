require "httparty"

module Databox
  autoload :VERSION,  "databox/version"

  autoload :Client,         "databox/client"
  autoload :Pipeline,       "databox/pipeline"
  autoload :Funnel,         "databox/funnel"
  autoload :Pie,            "databox/pie"
  autoload :Progress,       "databox/progress"
  autoload :Table,          "databox/table"
  autoload :Message,        "databox/message"
  autoload :Configuration,  "databox/configuration"

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
