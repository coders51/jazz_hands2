# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jazz_hands2/version'

Gem::Specification.new do |spec|
  spec.name          = "jazz_hands2"
  spec.version       = JazzHands2::VERSION
  spec.authors       = ["Enrico Carlesso"]
  spec.email         = ["enricocarlesso@gmail.com"]
  spec.summary       = "Successor of abandoned jazz_hands gem. Exercise those fingers. Pry-based enhancements for the default Rails console."
  spec.description   = 'Spending hours in the rails console? Spruce it up and '\
    'show off those hard-working hands! jazz_hands replaces IRB with Pry, '\
    'improves output through awesome_print, and has some other goodies up its '\
    'sleeves. Only Ruby >= 2'
  spec.homepage      = "https://github.com/coders51/jazz_hands2"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0.0'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency 'pry', '>= 0.9.12'
  spec.add_runtime_dependency 'pry-rails', '~> 0.3.2'
  spec.add_runtime_dependency 'pry-doc', '~> 0.4.6'
  spec.add_runtime_dependency 'pry-git', '~> 0.2.3'
  spec.add_runtime_dependency 'pry-stack_explorer', '~> 0.4.9'
  spec.add_runtime_dependency 'pry-remote', '>= 0.1.7'
  spec.add_runtime_dependency 'pry-byebug', '> 1.3'
  spec.add_runtime_dependency 'hirb', '~> 0.7.1'
  spec.add_runtime_dependency 'coolline', '>= 0.4.2'
  # spec.add_runtime_dependency 'awesome_print', '~> 1.2'
  spec.add_runtime_dependency 'railties', '>= 3.0', '< 5.0'
end
