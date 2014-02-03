# Databox [![Gem Version][fury-badge]][fury] [![Build Status][travis-badge]][travis]

Ruby Gem for [Databox](http://databox.com/) - Mobile Executive Dashboard.

- By [Oto Brglez](https://github.com/otobrglez)

## Installation

Add this line to your application's Gemfile:

    gem 'databox'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install databox

## Usage

You can use Databox::Client directly to insert raw KPIs. This is done by invoking Databox::Client and pushing Hash or Array of Hashes to it.

```ruby
client = Databox.client

client.push([{
  key: "name",
  date: "2014-01-22T12:00:00",
  value: 1
}])

puts client.logs
```

Databox gem support following widgets

- [Pipeline](https://developers.databox.com/push/v1/widgets/pipeline)
- [Funnel](https://developers.databox.com/push/v1/widgets/funnel)
- [Pie](https://developers.databox.com/push/v1/widgets/pie)
- [Messages](https://developers.databox.com/push/v1/widgets/messages)

### Pipeline
```ruby
pipeline = Databox::Pipeline.new "pipe_visits"
pipeline.add "Negotiation", 1_121_603
pipeline.add "Proposal",    3_245_927
pipeline.add "Solution",    10_726_397
pipeline.save
```

### Funnel
```ruby
funnel = Databox::Funnel.new "funnel_simple"
funnel.add "Requests sent",   33_342
funnel.add "New Accounts",    25_350
funnel.add "Viewed results",  8_930
funnel.add "Return Visits",   3_580
funnel.save
```

### Pie
```ruby
pie = Databox::Pie.new "my_pie"
pie.add "A", 3_014
pie.add "B", 29_496
pie.add "C", 9_121
pie.add "D", 20_390
pie.add "E", 7_423
pie.save
```

### Messages

```ruby
messages = Databox::Messages.new "just_messages"
messages.add "I was here"
messages.add "Second message"
messages.save
```

## Versions

[Databox](https://github.com/otobrglez/databox) is tested on following Ruby versions

- MRI 1.9.3
- MRI 2.0.0

## Resources

- [Databox Web App](https://app.databox.com/)
- [Databox Developers Portal](https://developers.databox.com/)


[fury-badge]: https://badge.fury.io/rb/databox.png
[fury]: http://badge.fury.io/rb/databox
[travis-badge]: https://secure.travis-ci.org/otobrglez/databox.png?branch=master
[travis]: http://travis-ci.org/otobrglez/databox
