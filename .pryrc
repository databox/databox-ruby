require 'databox'

Databox.configure do |c|
  c.push_token = ENV["DATABOX_PUSH_TOKEN"]
end

client = Databox::Client.new