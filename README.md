# Databox bindings for Ruby

[![Build Status][travis-badge]][travis]
[![Gem Version](https://badge.fury.io/rb/databox.svg)](https://badge.fury.io/rb/databox)

Ruby Gem for [Databox](http://databox.com/) - Mobile Executive Dashboard.

## Installation

Add this line to your application's Gemfile:

    gem 'databox'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install databox

## Initialisation

Before pushing data to Databox you have to initialize it with token.

```ruby
Databox.configure do |c|
  c.push_token   = "YOUR_TOKEN"
end
```

## Usage

Pushing data directly to Databox with help of `push` method:

```ruby
client = Databox::Client.new

client.push(key: 'sales.total', value: 3000)
client.push(key: 'temp.boston', value: 52.0)
client.push(key: 'temp.boston', value: 52.0, date: '2015-01-01 17:00:00')
client.push(key: 'temp.boston', value: 52.0, attributes: {
    location: 'boston-south'
})

```

Inserting multiple matrices with one `insert_all`:

```ruby
client = Databox::Client.new

client.insert_all [
    {key: 'temp.boston', value: 52},
    {key: 'temp.boston', value: 50, date: '2015-01-01 17:00:00'},
    {key: 'temp.ny', value: 49}
]
```

Retrieving information from last push with `last_push`:

```ruby
client.last_push

# =>
#[{
#  "push"=>"{\"data\":[{\"$sales.total\":2000}]}",
#  "err"=>"[]",
#  "no_err"=>0,
#  "datetime"=>"2015-06-05T10:21:23.861Z",
#  "keys"=>"[\"132|sales.total\"]"
#}]
```

## Resources
- [Databox Web App](https://app.databox.com/)
- [Databox Developers Portal](https://developers.databox.com/)

## Author & License
- [Oto Brglez](https://github.com/otobrglez)
- [Vlada Petrović](https://github.com/VladaPetrovic)

## License
- Comes with `MIT` license and terms.

[travis-badge]: https://secure.travis-ci.org/databox/databox-ruby.png?branch=v2
[travis]: http://travis-ci.org/databox/databox-ruby
