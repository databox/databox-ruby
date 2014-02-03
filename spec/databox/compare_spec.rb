require "spec_helper"

describe Databox::Compare do

  let(:compare){ Databox::Compare.new "my_compare" }

  context "simple" do
    before {
      stub_request(:post, /push/)
      .to_return { request_from "compare_simple" }
    }

    before do
      compare.add 2000, "2014-01-25"
      compare.add 1600, "2014-01-26"
    end

    it { expect(compare.save).to be_true }

  end

end
