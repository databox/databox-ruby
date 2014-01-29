require "spec_helper"

describe Databox::Client do
  let(:client){ Databox.client }

  context "#push" do

    context "validation" do

      it do
        expect {
          client.push()
        }.to raise_error(Databox::InvalidRecord){ |e|
          expect(e.errors).to include "Data is missing"
        }
      end

      it do
        expect {
          client.push({})
        }.to raise_error(Databox::InvalidRecord)
      end

      it do
        expect {
          client.push({})
        }.to raise_error(Databox::InvalidRecord){ |e|
          expect(e.errors).to include "Key is required"
          expect(e.errors).to include "Value is required"
        }
      end

      it do
        expect {
          client.push({key:" w d d", date:"", value:"Oto was here"})
        }.to raise_error(Databox::InvalidRecord){ |e|
          expect(e.errors).to include "Date format is invalid"
          expect(e.errors).to include "Key format is invalid"
        }
      end

      it "validates list" do
        expect {
          client.push([
            {key:"what", date:"2014-01-29", value:1},
            {key:"what", date:"2014-01-29"}
          ])
        }.to raise_error(Databox::InvalidRecord){ |e|
          expect(e.errors).to include "Value is required"
        }
      end

    end

    # context "valid KPI" do
    #   it do
    #     expect(client.push({
    #       key: "databox_visits",
    #       date: "2014-01-29",
    #       value: 1
    #     })).to be_kind_of(Databox::Response)
    #   end
    # end

  end

  # context "#logs" do
  #   subject { client.logs }
  #   it { expect(subject).to be_kind_of Array }
  # end

end
