require "spec_helper"

describe Databox::Message do

  let(:client){ Databox::Client.new({
    url: "https://app.databox.com",
    key: "566m5nap2ls88sw44g440sww08s088sc",
    token: "2kw290l5m2gwgsw0"})
  }

  it "can send message" do
    puts Databox::Message.whoami
    puts Databox::Message.list
  end

end
