# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'databox/version'

Gem::Specification.new do |spec|
  spec.name          = "databox"
  spec.version       = Databox::VERSION
  spec.authors       = ["Oto Brglez"]
  spec.email         = ["otobrglez@gmail.com"]
  spec.description   = %q{Ruby Gem for Databox - Mobile Executive Dashboard.}
  spec.summary       = %q{API wrapper for Databox}
  spec.homepage      = "https://github.com/otobrglez/databox"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "shoulda-matchers"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "httparty"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"

end
