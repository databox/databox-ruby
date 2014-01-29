# Databox [![Gem Version][fury-badge]][fury] [![Build Status][travis-badge]][travis]

Ruby Gem for [Databox](http://databox.com/) - Mobile Executive Dashboard.

**IMPORTANT** THIS GEM IS IN DEVELOPEMENT AND SHOULD NOT BE USED.

- By [Oto Brglez](https://github.com/otobrglez)

## Installation

Add this line to your application's Gemfile:

    gem 'databox'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install databox

## Usage

### Client

You can use Databox::Client directly to insert raw KPIs. This is done by invoking Databox::Client and pushing Hash or Array of Hashes to it.

```ruby
client = Databox.client

client.push([{
  key: "name",
  date: "2014-01-22T12:00:00",
  value: 1
}])

client.logs
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
