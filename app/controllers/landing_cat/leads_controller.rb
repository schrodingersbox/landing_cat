module LandingCat
  class LeadsController < ApplicationController

    # POST /leads
    def create
      @lead = Lead.new( lead_params )
      @lead.campaign = Campaign.find_or_create_by_cookies( cookies )
      @lead.save
    end

  private

    # Only allow a trusted parameter "white list" through.
    def lead_params
      params[ :lead ].permit( :email )
    end

  end
end
