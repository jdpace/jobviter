# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "jobviter/version"

Gem::Specification.new do |s|
  s.name        = "jobviter"
  s.version     = Jobviter::VERSION
  s.authors     = ["Jared Pace"]
  s.email       = ["jared@codeword.io"]
  s.homepage    = ""
  s.summary     = %q{Jobvite job feed parser}
  s.description = %q{Simple ruby wrapper for pasing job feeds from Jobvite.com}

  s.rubyforge_project = "jobviter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # Dependencies
  s.add_dependency 'typhoeus', ['~> 0.2.4']
  s.add_dependency 'nokogiri', ['~> 1.4.6']

  # Developmnet Dependencies
  s.add_development_dependency 'rspec', ['~> 2.6']
  s.add_development_dependency 'mocha', ['~> 0.9.12']
end
