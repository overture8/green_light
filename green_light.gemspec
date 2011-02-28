# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "green_light/version"

Gem::Specification.new do |s|
  s.name        = "green_light"                                                                                                                                                                              
  s.version     = GreenLight::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Phil McClure"]
  s.email       = ["pmcclure@rumblelabs.com"]
  s.homepage    = "http://www.rumblelabs.com"
  s.summary     = %q{Simple client side validation that keeps validation in the models}
  s.description = %q{Simple client side validation that keeps validation in the models}

  s.rubyforge_project = "green_light"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
