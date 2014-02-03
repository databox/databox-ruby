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
          # expect(e.errors).to include "Value is required"
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
            {date:"2014-01-29"},
            {key:"what", date:"2014-01-29"}
          ])
        }.to raise_error(Databox::InvalidRecord){ |e|
          expect(e.errors).to include "Key is required"
        }
      end

    end

    context "valid KPI" do
      before {
        stub_request(:post, /push/).to_return { request_from "simple_push" }
      }

      let(:data){ {
        key: "databox_visits",
        date: "2014-01-29",
        value: 1
      } }

      let!(:response){ client.push(data) }

      it { expect(response).to be_kind_of(Databox::Response) }
      it { expect(response).to be_success }

    end

    # #TODO: Validation on server is down.
    # context "too many requests" do
    #   before {
    #     stub_request(:post, /push/).to_return { request_from "invalid_push" }
    #     Databox::Client.any_instance.stub(:validate).and_return(true)
    #   }
    #   let(:data){{
    #     key:"o t o",
    #     date: "d d d",
    #     value: "-2"
    #   }}
    #   let!(:response){ client.push(data) }
    #   it { expect(response).to be_kind_of(Databox::ClientError) }
    # end

  end

  context "#logs" do
    before { stub_request(:get, /logs/).to_return { request_from "logs" } }
    subject { client.logs }
    it { expect(subject).to be_kind_of Array }
  end

end
