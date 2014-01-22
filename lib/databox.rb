require "httparty"

module Databox
  autoload :VERSION,  "databox/version"

  autoload :Client,   "databox/client"
  autoload :Pipeline, "databox/pipeline"
  autoload :Funnel,   "databox/funnel"
  autoload :Pie,      "databox/pie"
  autoload :Progress, "databox/progress"
  autoload :Table,    "databox/table"
  autoload :Message,  "databox/message"

  class << self
    extend Forwardable

    def client
      @client ||= Databox::Client.new
    end

  end

end
