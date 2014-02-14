module LandingCat
  class PagesController < PublicController

    before_action :set_page, only: [ :show ]

    def show
    end

  private
    def set_page
      @page = Page.find( params[ :id ] )
    end

  end
end
