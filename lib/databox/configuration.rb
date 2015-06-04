class Databox::Configuration
  attr_accessor :push_token, :push_host

  def initialize
    @push_host ||= 'https://push2new.databox.com'
    @push_token ||= ENV['DATABOX_PUSH_TOKEN']
  end
end
