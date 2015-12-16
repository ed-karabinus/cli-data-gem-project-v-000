# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wiki_on_this_day/version'

Gem::Specification.new do |s|
  s.name          = 'wiki_on_this_day'
  s.version       = WikiOnThisDay::VERSION
  s.date          = "2015-12-14"
  s.summary       = "Find out what happened on this day in the past, using Wikipedia!"
  s.description   = "This gem scrapes the English Wikipedia Homepage (https://en.wikipedia.org/wiki/Main_Page) and obtains the list of significant historical events (and their abstracts) available there. Optionally, users may select one of the historical events and request the text of the linked article."
  s.authors       = ["Ed Karabinus"]
  s.email         = 'karabinus@uchicago.edu'
  s.files         = `git ls-files`.split($\)
  s.executables   = ["wiki_on_this_day"]
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib", "lib/wiki_on_this_day"]
  s.homepage      = 'http://rubygems.org/gems/wiki_on_this_day'
  s.license       = 'MIT'

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec"
  s.add_development_dependency "nokogiri"
  s.add_development_dependency "open-uri"
  s.add_development_dependency "pry"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock"
  s.add_development_dependency "tempfile"
end