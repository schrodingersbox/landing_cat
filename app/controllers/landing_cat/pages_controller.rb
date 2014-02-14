module LandingCat
  class PagesController < ApplicationController

    before_action :set_page, only: [ :show ]

    # GET /pages/1
    def show
      @lead = Lead.new( :page_id => @page.id )
    end

  private
    def set_page
      @page = Page.find( params[ :id ] )
    end

  end
end
