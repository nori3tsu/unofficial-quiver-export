# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unofficial/quiver/export/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '~> 2.0'

  spec.name          = "unofficial-quiver-export"
  spec.version       = Unofficial::Quiver::Export::VERSION
  spec.authors       = ["Norimitsu YAMASHITA"]
  spec.email         = ["tugend.licht@gmail.com"]

  spec.summary       = %q{This gem exports plain text files within Quiver notebooks.}
  spec.description   = %q{This is the un-official gem for Quiver. It exports plain text files within Quiver notebooks.}
  spec.homepage      = "https://github.com/nori3tsu/unofficial-quiver-export"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = %w(quiver-export)
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
