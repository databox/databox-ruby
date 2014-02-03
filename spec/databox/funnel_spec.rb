require "spec_helper"

describe Databox::Funnel do

  before do
    Databox.configure do |c|
      c.token   = "218oxlmk3ikkogo0"
      c.key = "3s70rekrhcmcgkccssckc448kgw04ssk"
    end
  end

  let(:funnel){ Databox::Funnel.new "little_funnel" }

  context "simple" do
    before {
      stub_request(:post, /push/)
      .to_return { request_from "funnel_simple" }
    }

    before do
      funnel.add "Requests sent",   2000
      funnel.add "New Accounts",    1600
      funnel.add "Viewed results",  999
    end

    it { expect(funnel.save).to be_true }

  end

end
