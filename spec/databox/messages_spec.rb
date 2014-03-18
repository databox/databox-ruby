require "spec_helper"

describe Databox::Messages do

  let(:messages){ Databox::Messages.new("just_messages") }

  context "add messages" do
    it { expect(messages.name).to eq "just_messages" }

    it {
      expect { messages.add("Just message", "Number") }
      .to change { messages.list.size }.from(0).to(1)
    }


    context "save" do
      context "simple" do
        before {
          stub_request(:post, /push/)
          .to_return { request_from "simple_message" }
        }

        before { messages.add("I was here", "USD") }

        it {
          expect { messages.save }
          .to change { messages.list.size }.to(0)
        }
      end

      context "multiple" do
        before {
          stub_request(:post, /push/)
          .to_return { request_from "multiple_message" }
        }

        before do
          messages.add("I was here", "Number")
          messages.add("This is test", "EUR")
        end

        it {
          expect { messages.save }
          .to change { messages.list.size }.to(0)
        }
      end

    end

  end

end
