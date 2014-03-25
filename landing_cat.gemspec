$:.push File.expand_path('../lib', __FILE__)

require 'landing_cat/version'

Gem::Specification.new do |s|
  s.name        = 'landing_cat'
  s.version     = LandingCat::VERSION
  s.authors     = ['Rich Humphrey']
  s.email       = ['rich@schrodingersbox.com']
  s.homepage    = 'https://github.com/schrodingersbox/landing_cat'
  s.summary     = 'A Rails engine for landing pages'
  s.description = ''

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 4.0', '>= 4.0.0'
  s.add_dependency 'kaminari', '~> 0.15'
  s.add_dependency 'split_cat', '~> 0.0.9'

  s.add_development_dependency 'sqlite3', '~> 1.3', '>= 1.3.8'
  s.add_development_dependency 'rspec', '~> 2.14', '>= 2.14.0'
  s.add_development_dependency 'rspec-rails', '~> 2.14', '>= 2.14.0'
  s.add_development_dependency 'webrat', '~> 0.7', '>= 0.7.3'
  s.add_development_dependency 'factory_girl_rails', '~> 4.0'
  s.add_development_dependency 'simplecov', '~> 0.8', '>= 0.8.2'
  s.add_development_dependency 'coveralls', '~> 0.7', '>= 0.7.0'
  s.add_development_dependency 'jquery-rails'
end
