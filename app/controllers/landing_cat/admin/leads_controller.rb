module LandingCat
  module Admin
    class LeadsController < LandingCat::AdminController

      before_action :set_lead, only: [:show, :destroy]

      def index
        @leads = Lead.all.order( 'created_at desc' )

        respond_to do |format|
          format.html { @leads = @leads.page( params[ :page ] ) }
          format.csv { render :text => Lead.to_csv( @leads ), :content_type => 'text/csv' }
        end
      end

      def show
      end

      def destroy
        @lead.destroy
        redirect_to admin_leads_path, notice: 'Lead was successfully destroyed.'
      end

    private

      def set_lead
        @lead = Lead.find(params[:id])
      end

      def lead_params
        params[ :lead ].permit( Lead.new.attributes.keys ) if params[ :lead ]
      end

    end
  end
end
