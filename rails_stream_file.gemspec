# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rails/stream_file"

Gem::Specification.new do |spec|
  spec.name          = "rails_stream_file"
  spec.version       = Rails::StreamFile::VERSION
  spec.authors       = ["Bernardo Farah"]
  spec.email         = ["bfarah@walmart.com"]

  spec.summary       = "Add file streaming as a method in ActionController"
  spec.description   = "Allows file streaming where files are enumerables"
  spec.homepage      = "https://github.com/berfarah/rails_stream_file"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^spec/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
