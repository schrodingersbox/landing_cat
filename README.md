# schrodingersbox/landing_cat README

This engine provides landing pages with several notable features:
  * Captures email addresses as leads
  * Captures ad campaign information
  * Split test support

It is currently _very_ incomplete.

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

### Create your first landing page

1.  Create an experiment
2.  Create a page

NOTE: Experiment name is used in URL and user visible

### Secure the administrative interface

Define your authentication method on ApplicationController:

    class ApplicationController < ActionController::Base
      def authenticate!
        render :text => 'forbidden' unless cookies[ :login ]
      end
    end

Create or add to `config/initializers/landing_cat.rb`

    LandingCat.configure do |config|
      config.admin_before_filter = :authenticate!
    end

### Apply custom layouts

Create or add to `config/initializers/landing_cat.rb`

    LandingCat.configure do |config|
      config.admin_layout = 'admin'
      config.public_layout = 'application'
    end

### Add more attributes to a landing page

Just add columns to the landing_cat_pages table and access them off @page in the view file.

### Receive a callback when a new lead is created

Create or add to `config/initializers/landing_cat.rb`

    LandingCat.configure do |config|
      config.lead_after_create = ->(lead) { Rails.logger.info "LEAD CREATED: #{lead.email}" }
    end

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

* Better admin navigation

* As needed
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
