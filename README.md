# Horizons

Horizons is a gem to get information from [NASA JPL SSD Horizons Telnet interface](http://ssd.jpl.nasa.gov/?horizons#telnet).

**Be careful**, this gem is still under development and major changes may occur.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'horizons'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install horizons

## Usage

```ruby
mars = 499
client = Horizons::Client.new
body = Horizons::Body.find(client, mars)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/rhannequin/horizons](https://github.com/rhannequin/horizons).


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

