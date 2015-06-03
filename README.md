:warning: :warning: Databox Push API has significally changed. This wrapper is outdated and is beeing rewritten! -[Oto](https://twitter.com/otobrglez)

# Databox

[![Gem Version][fury-badge]][fury] [![Build Status][travis-badge]][travis]

Ruby Gem for [Databox](http://databox.com/) - Mobile Executive Dashboard.

## Installation

Add this line to your application's Gemfile:

    gem 'databox'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install databox

## Usage

Before using Databox gem you have to initialize it with key and token. There are 3 ways how you can do initialization.

- Within simple initializer

  ```ruby
  Databox.configure do |c|
    c.token   = "YOUR_TOKEN"
    c.key     = "YOUR_KEY"
  end
  ```

- By setting system ```ENV``` variables ```DATABOX_KEY``` and ```DATABOX_TOKEN```

- If your are using custom integration with different key please use ```id```.

  ```ruby
  chart = Databox::LineChart.new "my_line", id: "OTHER_KEY"
  ```

## Using client directly

You can also use Databox::Client directly to insert raw KPIs. This is done by invoking Databox::Client and pushing Hash or Array of Hashes to it.

```ruby
client = Databox.client

client.push([{
  key: "name",
  date: "2014-01-22T12:00:00",
  value: 1
}])

puts client.logs
```

## Resources

- [Databox Web App](https://app.databox.com/)
- [Databox Developers Portal](https://developers.databox.com/)


[travis-badge]: https://secure.travis-ci.org/databox/databox-ruby.png?branch=v2
[travis]: http://travis-ci.org/databox/databox-ruby
