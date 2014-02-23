module LandingCat
  module Admin
    class CampaignsController < LandingCat::AdminController

      def index
        @campaign = Campaign.new( campaign_params )
        @campaigns = Campaign.all.order( 'created_at desc' )

        respond_to do |format|
          format.html { @campaigns = @campaigns.page( params[ :page ] ) }
          format.csv { render :text => Campaign.to_csv( @campaigns ), :content_type => 'text/csv' }
        end
      end

    private

      def campaign_params
        params[ :campaign ].permit( Campaign.new.attributes.keys ) if params[ :campaign ]
      end

    end
  end
end
