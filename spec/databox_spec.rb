require "spec_helper"

describe Databox do

  context "VERSION" do
    it { expect(Databox::VERSION).to match /^\d+.\d+.\d+/ }
  end

  context "DATABOX_MODE" do
    it { expect(ENV["DATABOX_MODE"]).to eq "test" }
  end

end
