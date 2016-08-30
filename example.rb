#!/usr/bin/env ruby
require 'pp'
require 'bundler/setup'
require 'databox'

Databox.configure do |c|
  c.push_token   = ENV["DATABOX_PUSH_TOKEN"]
end

client = Databox::Client.new()

3.times do |t|
	client.push(key: "example.ruby", value: t*100, date:(DateTime.now - t).strftime('%Y-%m-%d'))
end

client.push(key: "example.ruby.unit", value: 100, unit: "USD")

pp client.last_push(3)
