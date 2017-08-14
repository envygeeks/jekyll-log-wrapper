# Frozen-string-literal: true
# Copyright: 2017 Jordon Bedwell - MIT License
# Encoding: utf-8

$LOAD_PATH.unshift(File.expand_path("../lib", __FILE__))
require "jekyll/log_wrapper/version"

Gem::Specification.new do |spec|
  spec.authors = ["Jordon Bedwell"]
  spec.version = Jekyll::LogWrapper::VERSION
  spec.summary = "A logger compliant wrapper."
  spec.description = "A wrapper to make Jekyll's logger compliant"
  spec.homepage = "http://github.com/envygeeks/jekyll-log-wrapper"
  spec.files = %W(Gemfile) + Dir["lib/**/*"]
  spec.required_ruby_version = ">= 2.1.0"
  spec.email = ["jordon@envygeeks.io"]
  spec.name = "jekyll-log-wrapper"
  spec.require_paths = ["lib"]
  spec.has_rdoc = false
  spec.license = "MIT"

  spec.add_development_dependency("rspec", ">= 3", "< 4")
  spec.add_development_dependency("luna-rspec-formatters", "~> 3.7")
  spec.add_runtime_dependency("forwardable-extended", "~> 2.6")
  spec.add_runtime_dependency("jekyll", "~> 3.1")
end
