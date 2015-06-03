:warning: Databox Push API has significally changed. This wrapper is outdated and is beeing rewritten! -[Oto](https://twitter.com/otobrglez) :warning:

# Databox

[![Gem Version][fury-badge]][fury] [![Build Status][travis-badge]][travis] [![Coverage Status](https://coveralls.io/repos/otobrglez/databox/badge.png?branch=master)](https://coveralls.io/r/otobrglez/databox?branch=master)

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

Databox gem support following widgets

| Widget          | Implemented   | Example                        | Databox Documentation
| --------------- | :-----------: | ------------------------------ | ----------------------
| Big Number      | Yes           | [Example](#big-number)         | [Basic Widgets / Big Number](https://developers.databox.com/push/v1/widgets/main/#big-number)
| Compare         | Yes           | [Example](#compare)            | [Basic Widgets / Compare](https://developers.databox.com/push/v1/widgets/main/#compare)
| Internal        | Yes           | [Example](#interval)    | [Basic Widgets / Interval Values](https://developers.databox.com/push/v1/widgets/main/#interval-values)
| Line Chart      | Yes           | [Example](#line-chart)         | [Basic Widgets / Line Chart](https://developers.databox.com/push/v1/widgets/main/#line-chart-and-bar-chart)
| Bar Chart       | Yes           | [Example](#bar-chart)          | [Basic Widgets / Bar Chart](https://developers.databox.com/push/v1/widgets/main/#line-chart-and-bar-chart)
| Pipeline        | Yes           | [Example](#pipeline)           | [Pipeline](https://developers.databox.com/push/v1/widgets/pipeline/)
| Funnel          | Yes           | [Example](#funnel)             | [Funnel](https://developers.databox.com/push/v1/widgets/funnel/)
| Pie             | Yes           | [Example](#pie)                | [Pie](https://developers.databox.com/push/v1/widgets/pie/)
| Progress        | Yes           | [Example](#progress)           | [Progress](https://developers.databox.com/push/v1/widgets/progress/)
| Table           | No            |                                |
| Messages        | Yes           | [Example](#messages)           | [Messages](https://developers.databox.com/push/v1/widgets/messages/)


### Big Number
```ruby
number = Databox::BigNumber.new "just_number"
number.set 5000
number.save

# You can set date on initialize
number_dated = Databox::BigNumber.new "just_number", date: "2014-02-03"
# Or when setting number
number_dated.set 10_000, "2014-02-03"
number_dated.save

```

### Line Chart
```ruby
chart = Databox::LineChart.new "my_line"
chart.add 40,   "2014-01-29"
chart.add 100,  "2014-02-01"
chart.add 500,  "2014-02-02"
chart.add 20,   "2014-02-03"
chart.save

```

### Bar Chart
```ruby
chart = Databox::BarChart.new "my_bar"
chart.add 40,   "2014-01-29"
chart.add 100,  "2014-02-01"
chart.add 500,  "2014-02-02"
chart.add 20,   "2014-02-03"
chart.save
```

### Compare
```ruby
compare = Databox::BarChart.new "my_compare"
compare.add 40,   "2014-01-29"
compare.add 100,  "2014-02-01"
compare.add 500,  "2014-02-02"
compare.add 20,   "2014-02-03"
compare.save
```

### Interval
```ruby
interval = Databox::BarChart.new "my_interval"
interval.add 40,   "2014-01-29"
interval.add 100,  "2014-02-01"
interval.add 500,  "2014-02-02"
interval.add 20,   "2014-02-03"
interval.save
```

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

### Progress
```ruby
progress = Databox::Progress.new "my_progress"
progress.set "33% done", 100, 33
pie.save
```

### Messages

```ruby
messages = Databox::Messages.new "just_messages"
messages.add "I was here"
messages.add "Second message"
messages.save
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
