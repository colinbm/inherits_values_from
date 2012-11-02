require './lib/inherits_values_from/version.rb'

Gem::Specification.new do |s|
  s.name        = 'inherits_values_from'
  s.version     = InheritsValuesFrom::VERSION
  s.summary     = "Allows a model to inherit values from another when its values are null"
  s.description = ""
  s.authors     = ["Colin Burn-Murdoch"]
  s.email       = 'colin@burn-murdoch.com'
  s.files       = ["lib/inherits_values_from.rb", "lib/inherits_values_from/version.rb"]
  s.homepage    = 'http://rubygems.org/gems/inherits_values_from'
end