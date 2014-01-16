module LandingCat
  module Admin
    class LeadsController < ApplicationController
      before_action :set_lead, only: [:show, :destroy]

      # GET /leads
      def index
        @leads = Lead.all
      end

      # GET /leads/1
      def show
      end

      # DELETE /leads/1
      def destroy
        @lead.destroy
        redirect_to admin_leads_url, notice: 'Lead was successfully destroyed.'
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_lead
          @lead = Lead.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def lead_params
          params[:lead]
        end
    end
  end
end
