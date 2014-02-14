module LandingCat
  class LeadsController < ApplicationController

    before_filter :set_split_cat_cookie, :only => :create

    # POST /leads
    def create
      @lead = Lead.find_or_create_by( lead_params )
      @lead.campaign = Campaign.find_or_create_by_cookies( cookies )
      @lead.save

      split_cat_goal( params[ :experiment ], Page::EXPERIMENT_GOAL, @split_cat_token )
    end

  private

    def lead_params
      params[ :lead ].permit( Lead.new.attributes.keys )
    end

  end
end
