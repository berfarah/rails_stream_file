# Rails::StreamFile

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_stream_file', git: 'https://github.com/berfarah/rails_stream_file', require: "rails/stream_file"
```

And then execute:

    $ bundle

## Usage

Adds `stream_file` method to rails which takes an enumerator to output a binary file. Example usage below:

```ruby
require "csv"
class EnumerableObject
  def each(&block)
    block.call %w(My Headers Go Here).to_csv
    block.call [1, 2, 3, 4].to_csv
    [
      [123, 123, 123, 123],
      [123, 123, 123, 123]
    ].each { |e| block.call(e.to_csv) }
  end
end

class MyController < ActionController::Base
  def show
    stream_file EnumerableObject.new, filename: "example.csv", mimetype: "text/csv"
  end
end
```

## Development

After checking out the repo, run `bundle` to install dependencies. Then, run `rake rspec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
