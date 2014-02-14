# schrodingersbox/landing_cat README

This engine provides landing pages with several notable features:
  * Captures email addresses as leads
  * Captures ad campaign information
  * Split test support

It is currently incomplete.

## Getting Started

1. Add this to your `Gemfile` and `bundle install`

		gem 'landing_cat', :git => 'https://github.com/schrodingersbox/landing_cat.git'
        gem 'split_cat'

2. Add this to your `config/routes.rb`

		mount LandingCat::Engine => '/landing_cat'

3. Install and run migrations

        rake landing_cat:install:migrations
        rake split_cat:install:migrations
        rake db:migrate

4. Restart your Rails server

5.  Visit http://yourapp/landing_cat in a browser

## How To

### Secure the administrative interface

Modify `config.application.rb` to inject your authorization filter into the controller:

    config.after_initialize do
      LandingCat::AdminController.instance_eval do
        before_filter :require_login
      end
    end

### Apply custom layouts

Create or add to `config/initializers/landing_cat.rb`

    LandingCat.configure do |config|
      config.layout_admin = 'admin'
      config.layout_public = 'application'
    end

### Create your first landing page

NOTE: Page name is used in URL and user visible

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

* Configure authorization for admin
* Better admin navigation

* As needed
    * Mailer for new leads
    * Export leads in CSV
    * Capture user agent for leads
    * Rails generator to externalize view files, like Devise
    * Add page attribute to identify template to use
    * Support more than 2 hypotheses - add a few more?  or text field entry?

* Improve admin rendering
  * Add page and campaign to /admin/leads/show
  * div -> fieldset in _forms
  * general ugliness
* Externalize i18n strings
* Add reasonable size limits to db string columns

* Leads by channel report
