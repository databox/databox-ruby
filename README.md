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

```ruby
require "databox"

# Configure it like this
Databox.configure do |c|
  c.key = "Databox key"
  c.token = "Databox token"
end

client = Databox.client

client.push([{
  date: "2014-01-22T12:00:00",
  key: "name",
  value: 1
}])

client.logs
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
