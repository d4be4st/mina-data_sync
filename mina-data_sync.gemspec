# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mina/data_sync/version'

Gem::Specification.new do |spec|
  spec.name          = "mina-data_sync"
  spec.version       = Mina::DataSync::VERSION
  spec.authors       = ["Stjepan Hadjic"]
  spec.email         = ["d4be4st@gmail.com"]
  spec.summary       = "Summary"
  spec.description   = "Description"
  spec.homepage      = "https://github.com/d4be4st/mina-data_sync"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0"

  spec.add_dependency 'mina', '>= 0.3.4'
end
