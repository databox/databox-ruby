require "spec_helper"

require "pp"

describe Databox::Client do
  let(:key){ "566m5nap2ls88sw44g440sww08s088sc" }
  let(:url){ "https://app.databox.com" }
  let(:token){ "2kw290l5m2gwgsw0" }
  let(:config){ {url: url, key: key, token: token} }

  it "can push" do
    client = Databox::Client.new(config)

    puts client.push([{
      date: "2014-01-22T12:00:00",
      key: "name",
      value: 1
    }]).inspect
  end

end
