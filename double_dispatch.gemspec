# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'double_dispatch/version'

Gem::Specification.new do |spec|
  spec.name          = "double_dispatch"
  spec.version       = DoubleDispatch::VERSION
  spec.authors       = ["Manuel Morales"]
  spec.email         = ["manuelmorales@gmail.com"]
  spec.summary       = %q{Allows double dispatching method calls.}
  spec.description   = %q{Allows the creation of different implementations of the same method based on the class of the method arguments, similar to overloading in Java.}
  spec.homepage      = "https://github.com/manuelmorales/double_dispatcher"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "rspec", "~> 3.1.0"
end

