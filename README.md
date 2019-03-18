# Frinkiac

A ruby wrapper to interact with Frinkiac.com API based on Ben Lewis's post: [Wrapping Your API In A Custom Ruby Gem](https://blog.engineyard.com/2014/wrapping-your-api-in-a-ruby-gem).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'frinkiac', '~> 0.0.5'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install frinkiac -v 0.0.5

## Usage

There are a couple ways to get screencaps from the Frinkiac API through this gem.

You can get an array of screencaps that match a specific search term:

```
Frinkiac::Screencap.search('lazy saturday')
```


And you can get a random screencap from the aforementioned array of screencaps:

```
Frinkiac::Screencap.random('lazy saturday')
```

After getting a screencap object, you now have easy access to the attributes: ```id```, ```episode``` and ```timestamp```.

The ```Frinkiac::Screencap``` object also gives you access to some helper methods to make your life easier.

There's the ```image_url``` method that returns a valid image url based on the episode and timestamp information returned by the API.

The ```caption``` method hits the API's caption endpoint and returns a string of the original screencap's caption.

And finally, there's the ```meme_url```. When used without params, this returns the original caption overlaid on top of the image.

You can also customize the image by overlaying your own captions on top of the image like so:

```
screencap.meme_url("I love those lazy Saturdays")
```
Or multiple lines of text like so:
```
screencap.meme_url(["I love those lazy Saturdays", "Unlike that fake Saturday that almost got me fired"])
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chanko/frinkiac. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
