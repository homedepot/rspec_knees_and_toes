# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'head_and_shoulders/version'

Gem::Specification.new do |spec|
  spec.name          = 'head_and_shoulders'
  spec.version       = HeadAndShoulders::VERSION
  spec.authors       = ['THD Ruby Red']
  spec.email         = ['thd_paint_engineering@googlegroups.com']

  spec.summary       = %q{Run RSpec bisect on failed Parallel Tests runs}
  spec.description   = %q{Parallel Tests speeds up your test suite, but it makes it more complicated to diagnose test pollution. This gem provides a rake task for bisecting failed Parallel Tests test suite slices.}
  spec.homepage      = 'https://github.homedepot.com/Paint/head_and_shoulders'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://www.homedepot.com'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = []
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
