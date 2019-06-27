# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec_knees_and_toes/version'

Gem::Specification.new do |spec|
  spec.name          = 'rspec_knees_and_toes'
  spec.version       = RSpecKneesAndToes::VERSION
  spec.authors       = ['James A. Hall', 'Winston R. Milling']
  spec.email         = [
    'James_A_Hall@homedepot.com',
    'Winston_R_Milling@homedepot.com'
  ]

  spec.summary       = 'Run RSpec bisect on failed Parallel Tests runs'
  spec.description   = 'Parallel Tests speeds up your test suite, but it makes it more complicated to diagnose test pollution. This gem provides a rake task for bisecting failed Parallel Tests test suite slices.'
  spec.homepage      = 'https://github.com/homedepot/rspec_knees_and_toes'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = []
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '>= 1.11'
  spec.add_development_dependency 'codecov'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
