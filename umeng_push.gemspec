# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'umeng_push/version'

Gem::Specification.new do |spec|
  spec.name          = "umeng_push"
  spec.version       = UmengPush::VERSION
  spec.authors       = ["zhanglinjie"]
  spec.email         = ["zhanglinjie412@gmail.com"]
  spec.license       = "MIT"

  spec.summary       = "The encapsulation of umeng push api."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/zhanglinjie/umeng_push"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httpi"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry-byebug"
end
