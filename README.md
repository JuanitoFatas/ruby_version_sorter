# RubyVersionSorter

[![Gem Version](https://badge.fury.io/rb/ruby_version_sorter.svg)](https://badge.fury.io/rb/ruby_version_sorter)
[![Build Status](https://travis-ci.org/jollygoodcode/ruby_version_sorter.svg)][travis]

[gem]: https://rubygems.org/gems/ruby_version_sorter
[travis]: https://travis-ci.org/jollygoodcode/ruby_version_sorter

Sort Ruby Versions for human! Works for Ruby and JRuby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_version_sorter'

# or if you prefer double quote:

gem "ruby_version_sorter"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_version_sorter

## Usage

```ruby
> RubyVersionSorter.sort ["2.0.0", "2.0.0-rc1", "2.0.0-rc2", "2.0.0-preview1"]
=> ["2.0.0-preview1", "2.0.0-rc1", "2.0.0-rc2", "2.0.0"]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JuanitoFatas/ruby_version_sorter.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
