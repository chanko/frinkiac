# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'frinkiac/version'

Gem::Specification.new do |spec|
  spec.name          = "frinkiac"
  spec.version       = Frinkiac::VERSION
  spec.authors       = ['Cesar Camacho']
  spec.email         = ['chanko@gmail.com']

  spec.summary       = %q{Gem to wrap Frinkiac.com API}
  spec.description   = %q{Gem to wrap Frinkiac.com API}
  spec.homepage      = 'https://github.com/chanko/frinkiac'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.8.4'
  spec.add_development_dependency 'pry-byebug', '~> 1.3.3'
  spec.add_development_dependency 'vcr', '~> 3.0.1'
  spec.add_development_dependency 'webmock', '~> 1.22.6'

  spec.add_dependency 'faraday', '~> 0.9.2'
  spec.add_dependency 'json', '~> 1.8.3'
  spec.add_dependency 'word_wrap', '~> 1.0.0'
end
