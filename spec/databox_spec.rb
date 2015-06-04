require "spec_helper"

describe Databox do

  context "VERSION" do
    it { expect(Databox::VERSION).to match /^\d+.\d+.\d+/ }
  end

  context "DATABOX_MODE" do
    it { expect(ENV["DATABOX_MODE"]).to eq "test" }
  end

  context 'configuration' do
    before do
      Databox.configure do |c|
        c.push_token = ''
      end
    end

    it { expect(Databox.configuration.push_host).to match /push/ }
  end
end
