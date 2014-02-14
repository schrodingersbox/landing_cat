module LandingCat
  module Admin
    class LeadsController < LandingCat::AdminController

      before_action :set_lead, only: [:show, :destroy]

      def index
        @leads = Lead.all
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
