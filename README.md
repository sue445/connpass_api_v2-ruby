# ConnpassApiV2
[connpass API v2](https://connpass.com/about/api/v2/) client for Ruby

[![Gem Version](https://badge.fury.io/rb/connpass_api_v2.svg)](https://badge.fury.io/rb/connpass_api_v2)
[![test](https://github.com/sue445/connpass_api_v2-ruby/actions/workflows/test.yml/badge.svg)](https://github.com/sue445/connpass_api_v2-ruby/actions/workflows/test.yml)

## Requirements
* [connpass API key](https://connpass.com/about/api/v2/#section/%E6%A6%82%E8%A6%81/%E8%AA%8D%E8%A8%BC)

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add connpass_api_v2
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install connpass_api_v2
```

## Usage
```ruby
require "connpass_api_v2"

client = ConnpassApiV2.client(ENV["CONNPASS_API_KEY"])

client.get_events
```

All methods are followings

https://sue445.github.io/connpass_api_v2-ruby/ConnpassApiV2/Client.html

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

Steps to using `bin/console`

1. Get [connpass API key](https://connpass.com/about/api/v2/#section/%E6%A6%82%E8%A6%81/%E8%AA%8D%E8%A8%BC)
2. Put your key to `.env`

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sue445/connpass_api_v2.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
