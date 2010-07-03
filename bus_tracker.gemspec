# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = "bus_tracker"
  s.version     = '1.0.0'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mark Connell"]
  s.email       = ["mark@markconnell.co.uk"]
  s.homepage    = "http://github.com/mconnell/bus_tracker"
  s.summary     = "Access Edinburgh's bus tracker service via ruby."
  s.description = "A ruby interface for accessing service and bus stop information provided by the BusTracker service for Edinburgh's public transport."

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "activesupport"
  s.add_dependency "nokogiri", ">=1.4.1"
  s.add_development_dependency "fakeweb"

  s.files        = Dir['MIT-LICENSE', 'README.md', 'lib/**/*']
  s.require_path = 'lib'
end
