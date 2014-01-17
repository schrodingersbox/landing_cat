module LandingCat
  class LeadsController < ApplicationController

    # POST /leads
    def create
      @lead = Lead.new(lead_params)
      @lead.save
    end

  private

    # Only allow a trusted parameter "white list" through.
    def lead_params
      params[ :lead ].permit( :email )
    end

  end
end
