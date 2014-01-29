require "spec_helper"

#TODO: Wrap around Widget
describe Databox::Messages do

  let(:messages){ Databox::Messages.new("just_messages") }

  context "add messages" do
    it { expect(messages.name).to eq "just_messages" }

    it {
      expect { messages.add("Just message") }
      .to change { messages.list.size }.from(0).to(1)
    }


    context "save" do
      context "simple" do
        before {
          stub_request(:post, /push/)
          .to_return { request_from "simple_message" }
        }

        before { messages.add("I was here") }

        it {
          expect { messages.save }
          .to change { messages.list.size }.to(0)
        }
      end

      context "simple" do
        before {
          stub_request(:post, /push/)
          .to_return { request_from "multiple_message" }
        }

        before do
          messages.add "I was here"
          messages.add "This is test"
        end

        it {
          expect { messages.save }
          .to change { messages.list.size }.to(0)
        }
      end

    end

  end

end
