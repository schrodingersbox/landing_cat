module LandingCat
  module Admin
    class CampaignsController < LandingCat::AdminController

      def index
        @campaign = Campaign.new( campaign_params )
        @campaigns = Campaign.all
      end

    private

      def campaign_params
        params[ :campaign ].permit( Campaign.new.attributes.keys ) if params[ :campaign ]
      end

    end
  end
end
