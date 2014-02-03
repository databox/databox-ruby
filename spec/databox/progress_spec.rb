require "spec_helper"

describe Databox::Progress do

  let(:progress){ Databox::Progress.new "my_progress" }

  context "simple" do
    before {
      stub_request(:post, /push/)
      .to_return { request_from "progress_simple" }
    }

    before do
      progress.set "33% done", 100, 33
    end

    it { expect(progress.save).to be_true }
  end

end
