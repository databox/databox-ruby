require 'spec_helper'
require 'pp'

describe Databox::Client do
  before do
    Databox.configure do |c|
      c.push_token = 'adxg1kq5a4g04k0wk0s4wkssow8osw84'
    end

    allow_any_instance_of(Databox::Client).to receive(:raw_push)\
      .and_return({'id' => '147251'})
  end

  let!(:client) { Databox::Client.new }

  context 'push' do
    it { expect { client.push(nil) }.to raise_exception }
    it { expect { client.push(key: 'sales.total', value: nil) }.to raise_exception }
    it { expect { client.push(key: nil, value: 3000) }.to raise_exception }
    it { expect(client.push(key: 'sales.total', value: 2000)).to eq true }
  end

  context 'push w/ attributes' do
    it {
      payload = {
          key: 'test',
          value: 200,
          attributes: {
              'me': 'Oto'
          }
      }

      expect(client).to receive(:raw_push)
                            .with('/', [
                                         {"$test" => 200, :me => "Oto"}
                                     ])
                            .once.and_call_original
      expect(client.push(payload)).to eq true
    }
  end

  context 'insert_all' do
    it { expect { client.insert_all([
                                        {key: 'temp.lj'},
                                        {key: 'temp.ljx', value: 60.3},
                                    ]) }.to raise_exception }

    it { expect(client.insert_all([
                                      {key: 'temp.ljx', value: 4.3},
                                      {key: 'temp.ljx', value: 1.3, date: '2015-01-01 09:00:00'},
                                  ])).to eq true }
  end
end
