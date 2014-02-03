require "spec_helper"

describe Databox::BigNumber do

  before do
    Databox.configure do |c|
      c.token   = "1cgeco9oc5us88ss"
      c.key = "5u9s6ynhv0o44g4co8w00gw84cwgs0gw"
    end
  end

  let(:number){ Databox::BigNumber.new "just_number" }

  context "simple" do
    before {
      stub_request(:post, /push/)
      .to_return { request_from "big_number_simple" }
    }

    before { number.set 5000, "2014-02-03T00:00:00" }
    it { expect(number.to_data[:date]).not_to be_nil }
    it { expect(number.save).to be_true }
  end

  context "without date" do
    before { number.set 5000 }
    it { expect(number.to_data[:date]).to be_nil }
  end

  context "with constructor" do
    let(:number_2){ Databox::BigNumber.new "just_number", date: "2014-01-26T00:00:00" }
    before{ number_2.set 60000 }
    it { expect(number_2.to_data[:date]).not_to be_nil }
  end

end
