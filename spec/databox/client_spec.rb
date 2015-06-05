require 'spec_helper'
require 'pp'

describe Databox::Client do
  before do
    Databox.configure do |c|
      c.push_token = 'adxg1kq5a4g04k0wk0s4wkssow8osw84'
    end

    allow_any_instance_of(Databox::Client).to receive(:raw_push)\
      .and_return({'status'=> 'ok'})
  end

  let!(:client) { Databox::Client.new }

  context 'push' do
    it { expect { client.push(nil, nil) }.to raise_exception }
    it { expect { client.push('sales.total', nil) }.to raise_exception }
    it { expect { client.push(nil, 3000) }.to raise_exception }
    it { expect { client.push('sales.total', 2000) }.to be_true }
  end

  context 'insert_all' do
    it { expect { client.insert_all([
      {key: 'temp.lj'},
      {key: 'temp.ljx', value: 60.3},
    ])}.to raise_exception }

    it { expect { client.insert_all([
        {key: 'temp.ljx', value: 4.3},
        {key: 'temp.ljx', value: 1.3, date: '2015-01-01 09:00:00'},
    ])}.to be_true }
  end
end