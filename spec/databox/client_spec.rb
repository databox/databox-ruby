require 'spec_helper'
require 'pp'

describe Databox::Client do
  before do
    Databox.configure do |c|
      c.push_token = 'adxg1kq5a4g04k0wk0s4wkssow8osw84'
    end
  end

  let!(:client){ Databox::Client.new }

  context 'push' do
    it {
      r = client.push('sales.total', 1555)

      pp r
    }

  end

  context 'last_push' do
    it { expect(client.last_push).not_to be_empty }
  end
end