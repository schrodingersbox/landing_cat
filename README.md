# schrodingersbox/landing_cat README

This engine provides landing pages with several notable features:
  * Captures email addresses as leads
  * Captures ad campaign information
  * Integrates Google Analytics content experiments

It is currently incomplete.

## Getting Started

1. Add this to your `Gemfile` and `bundle install`

		gem 'landing_cat', :git => 'https://github.com/schrodingersbox/landing_cat.git'

2. Add this to your `config/routes.rb`

		mount LandingCat::Engine => '/landing_cat'

3. Install and run migrations

        rake meter_cat:install:migrations
        rake db:migrate

4. Restart your Rails server

6.  Visit http://yourapp/landing_cat in a browser

## How To

### Create your first landing page

### Use Google Analytics content experiments

### Add more attributes to a landing page

### Tag users with the ad campaign they came through

## Reference

 * [Getting Started with Engines](http://edgeguides.rubyonrails.org/engines.html)
 * [Testing Rails Engines With Rspec](http://whilefalse.net/2012/01/25/testing-rails-engines-rspec/)
 * [How do I write a Rails 3.1 engine controller test in rspec?](http://stackoverflow.com/questions/5200654/how-do-i-write-a-rails-3-1-engine-controller-test-in-rspec)
 * [Best practice for specifying dependencies that cannot be put in gemspec?](https://groups.google.com/forum/?fromgroups=#!topic/ruby-bundler/U7FMRAl3nJE)
 * [Clarifying the Roles of the .gemspec and Gemfile](http://yehudakatz.com/2010/12/16/clarifying-the-roles-of-the-gemspec-and-gemfile/)
 * [The Semi-Isolated Rails Engine](http://bibwild.wordpress.com/2012/05/10/the-semi-isolated-rails-engine/)
 * [FactoryGirl](https://github.com/thoughtbot/factory_girl)
 * [Better Specs](http://betterspecs.org)

## TODO

* Public interface
  * Pages resource
  * Leads resource
  * Capture campaign when lead created

* Config class - GA tracker ID
* GA content experiment integration

* Validation
  * Unique lead email?  Support resend or re-trigger if user re-enters

* Rake task to externalize view files, like Devise

* Improve admin rendering
  * Link /admin/leads/show to page and campaign
  * div -> fieldset
  * general ugliness
* Externalize i18n strings
* Add reasonable size limits to db string columns