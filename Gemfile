source "https://rubygems.org"

# Declare your gem's dependencies in landing_cat.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'

group :development, :test do
  gem 'simplecov', '0.6.4', :require => false
  gem 'spec_cat', :tag => 'v0.1.0', :git => 'https://github.com/schrodingersbox/spec_cat.git'
  gem 'status_cat', :tag => 'v0.0.4', :git => 'https://github.com/schrodingersbox/status_cat.git'
  gem 'shoulda-matchers'
end
