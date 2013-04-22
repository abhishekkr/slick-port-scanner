# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'portlick/version'

Gem::Specification.new do |spec|
  spec.name          = "portlick"
  spec.version       = Portlick::VERSION
  spec.authors       = ["AbhishekKr"]
  spec.email         = ["abhikumar163@gmail.com"]
  spec.description   = %q{Very general purpose and easy to use Port Scanner. Not some PenTesting utility.}
  spec.summary       = %q{Lick the ports for you and tells if tasty or not.}
  spec.homepage      = "https://github.com/abhishekkr/slick-port-scanner"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.executables   = %w( portlick )

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency 'arg0', '>= 0.0.3'
end
