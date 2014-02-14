$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'landing_cat/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'landing_cat'
  s.version     = LandingCat::VERSION
  s.authors     = ['Rich Humphrey']
  s.email       = ['rich@schrodingersbox.com']
  s.homepage    = 'https://github.com/schrodingersbox/landing_cat'
  s.summary     = 'A Rails engine for landing pages'
  s.description = ''

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 4.0'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'webrat'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'jquery-rails'
end
