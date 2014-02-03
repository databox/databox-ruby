require "spec_helper"

describe Databox::Integration do

  context "token" do
    subject { Databox::Integration.new(nil, id: "some fake token") }
    it { expect(subject.token).to eq "some fake token" }
    it { expect(Databox::Integration.new(nil).token).not_to be_nil }
  end

end
