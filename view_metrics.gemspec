# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'view_metrics/version'

Gem::Specification.new do |spec|
  spec.name          = "view_metrics"
  spec.version       = ViewMetrics::VERSION
  spec.authors       = ["Frans Krojegård"]
  spec.email         = ["frans.krojegard@mittmedia.se"]
  spec.description   = ""
  spec.summary       = "A gem to output some simple metrics for html-like files."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_dependency 'nokogiri'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
