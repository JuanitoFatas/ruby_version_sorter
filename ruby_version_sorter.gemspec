# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruby_version_sorter/version"

Gem::Specification.new do |spec|
  spec.name          = "ruby_version_sorter"
  spec.version       = RubyVersionSorter::VERSION
  spec.authors       = ["JuanitoFatas"]
  spec.email         = ["katehuang0320@gmail.com"]

  spec.summary       = %q{Sort Ruby & JRuby versions}
  spec.homepage      = "https://github.com/juanitofatas/ruby_version_sorter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r(^(spec)/)) }
  # spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r(^exe/)) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
