# Frinkiac

A ruby wrapper to interact with Frinkiac.com API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'frinkiac', '~> 0.0.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install frinkiac

## Usage

Tha main object defined in this gem is ```Frinkiac::Screencap```, which gives us easy access to the attributes returned by the API: ```id```, ```episode``` and ```timestamp```.

It also provides an ```image_url``` method, that takes the episode and timestamp information to return a valid image url.


Currently there are only two ways to interact with the API through this gem.

You can get an array of screencaps that match a specific search term:

```
Frinkiac::Screencap.search('lazy saturday')
```


And you can get a random screencap from the afromentioned array of screencaps:

```
Frinkiac::Screencap.random('lazy saturday')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/frinkiac. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

