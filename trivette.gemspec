# frozen_string_literal: true

require_relative 'lib/trivette/version'

Gem::Specification.new do |s|
  s.name = 'trivette'
  s.version = Trivette::VERSION
  s.summary = 'Run Sidekiq jobs in sequence'
  s.description = 'Run Sidekiq jobs in sequence'
  s.authors = ['Keith Barrette']
  s.license = 'MIT'
  s.homepage = 'https://github.com/kbarrette/trivette'

  s.files = Dir['{lib}/**/*.rb', 'LICENSE', 'README.md']
  s.require_path = 'lib'

  s.add_dependency 'activesupport'
  s.add_dependency 'sidekiq'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec_junit_formatter'
  s.add_development_dependency 'rubocop'
end
