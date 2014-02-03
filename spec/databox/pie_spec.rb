require "spec_helper"

describe Databox::Pie do

  before do
    Databox.configure do |c|
      c.token   = "218oxlmk3ikkogo0"
      c.key = "3s70rekrhcmcgkccssckc448kgw04ssk"
    end
  end

  let(:pie){ Databox::Pie.new "my_pie" }

  context "simple" do
    before {
      stub_request(:post, /push/)
      .to_return { request_from "pie_simple" }
    }

    before do
      pie.add "A",  3_014
      pie.add "B",  29_496
      pie.add "C",  9_121
      pie.add "D",  20_390
      pie.add "E",  7_423
    end

    it { expect(pie.save).to be_true }

  end

end
