# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wisper/async/version'

Gem::Specification.new do |spec|
  spec.name          = "wisper-async"
  spec.version       = Wisper::Async::VERSION
  spec.authors       = ["Kris Leech"]
  spec.email         = ["kris.leech@gmail.com"]
  spec.description   = "Adds async broadcasting of events to Wisper"
  spec.summary       = "Adds async broadcasting of events to Wisper"
  spec.homepage      = "https://github.com/krisleech/wisper-async"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'wisper', '~>1.0'
  spec.add_dependency 'celluloid'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rspec'
end
