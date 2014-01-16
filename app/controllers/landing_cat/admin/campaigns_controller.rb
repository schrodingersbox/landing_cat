module LandingCat
  module Admin
    class CampaignsController < ApplicationController

      # GET /campaigns
      def index
        @campaign = LandingCat::Campaign.new( campaign_params )
        @campaigns = LandingCat::Campaign.all
      end

      private

        # Only allow a trusted parameter "white list" through.
        def campaign_params
          params.require(:campaign).permit(LandingCat::Campaign.attributes.keys ) if params[ :campaign ]
        end
    end
  end
end
