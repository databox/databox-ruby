require "spec_helper"

describe Databox::Interval do

  let(:interval){ Databox::Interval.new "my_interval" }

  context "simple" do
    before {
      stub_request(:post, /push/)
      .to_return { request_from "interval_simple" }
    }

    before do
      interval.add 2000, "2014-01-25"
      interval.add 1600, "2014-01-26"
      interval.add 2200, "2014-01-27"
    end

    it { expect(interval.save).to be_true }

  end

end
