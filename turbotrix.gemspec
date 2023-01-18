# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'turbotrix/version'

Gem::Specification.new do |spec|
  spec.name          = 'turbotrix'
  spec.version       = Turbotrix::VERSION
  spec.authors       = 'Otavio Ehrenberger, based on work of Jon Moss'
  spec.email         = 'sassysoftwareservices@gmail.com'

  spec.summary       = 'Turbotrix enables the Trix rich text editor in Turbolinks-only Rails apps.'
  spec.description   = 'Turbotrix enables the Trix rich text editor in Turbolinks-only Rails apps.'
  spec.homepage      = 'https://github.com/octehren/turbotrix'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rails', ['> 4.1', '< 6.2']

  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'bundler', '~> 2'
  spec.add_development_dependency 'formtastic', '~> 3.0'
  spec.add_development_dependency 'simple_form', '~> 3.5'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rspec-activemodel-mocks'
  spec.add_development_dependency 'rubocop', '0.35.1'
end
