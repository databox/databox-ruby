#!/usr/bin/env ruby
require 'pp'
require 'bundler/setup'
require 'databox'

Databox.configure do |c|
  c.push_token   = ENV["DATABOX_PUSH_TOKEN"]
end

client = Databox::Client.new()

3.times do |t|
	client.push("example.ruby", t*100, (DateTime.now - t).strftime('%Y-%m-%d'))
end

pp client.last_push(3)

