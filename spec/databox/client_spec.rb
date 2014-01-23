require "spec_helper"

describe Databox::Client do
  let(:client){ Databox.client }

  context "#push" do
    subject { client.push(data) }

    context "single" do
      let(:data){ [{
        date: "2014-01-22T12:00:00",
        key: "name",
        value: 1
      }]}

      it { expect(subject).to be_kind_of Databox::Response }
    end

  end

  context "#logs" do
    subject { client.logs }
    it { expect(subject).to be_kind_of Array }
  end

end
