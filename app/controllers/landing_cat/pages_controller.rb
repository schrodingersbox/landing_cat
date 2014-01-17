module LandingCat
  class PagesController < ApplicationController
    before_action :set_page, only: [ :show ]

    # GET /pages/1
    def show
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      name = params[:name]
      @page = name ? Page.find_by_name( name ) : Page.find( params[ :id ] )
    end

    # Only allow a trusted parameter "white list" through.
    def page_params
      params[:page]
    end

  end
end
