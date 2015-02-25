# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'serpscan/version'

Gem::Specification.new do |spec|
  spec.name          = 'serpscan'
  spec.version       = Serpscan::VERSION
  spec.authors       = ['Dylan Montgomery']
  spec.email         = ['mail@citizensinspace.com']
  spec.summary       = 'API client for SERP Scan rank tracker'
  spec.description   = spec.summary
  spec.homepage      = 'https://serpscan.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'rest-client'
  spec.add_dependency 'json'
  spec.add_dependency 'queryparams'
end
