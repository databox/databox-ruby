module Databox
  autoload :VERSION,        'databox/version'
  autoload :Client,         'databox/client'
  autoload :Configuration,  'databox/configuration'

  class << self
    attr_accessor :configuration

    def configured?
      return false if configuration.nil?
      [configuration.push_host, configuration.push_token].compact.size == 2
    end

    def client
      @client ||= ::Client.new
    end
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration if block_given?
  end
end
