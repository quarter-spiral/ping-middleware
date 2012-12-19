# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ping-middleware/version'

Gem::Specification.new do |gem|
  gem.name          = "ping-middleware"
  gem.version       = Ping::Middleware::VERSION
  gem.authors       = ["Thorben Schröder"]
  gem.email         = ["stillepost@gmail.com"]
  gem.description   = %q{Middleware that responds to simple keep alive pings}
  gem.summary       = %q{Middleware that responds to simple keep alive pings}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
