module LandingCat
  module Admin
    class PagesController < LandingCat::AdminController

      before_action :set_page, only: [:edit, :update, :destroy]

      def index
        @pages = Page.all.order( 'experiment_id desc, experiment_type asc' ).includes( :experiment  )
      end

      def new
        @page = Page.new
      end

      def edit
      end

      def create
        @page = Page.new(page_params)

        if @page.save
          redirect_to admin_pages_path, notice: 'Page was successfully created.'
        else
          render action: 'new'
        end
      end

      def update
        if @page.update(page_params)
          redirect_to admin_pages_path, notice: 'Page was successfully updated.'
        else
          render action: 'edit'
        end
      end

      def destroy
        @page.destroy
        redirect_to admin_pages_path, notice: 'Page was successfully destroyed.'
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_page
          @page = Page.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def page_params
          params[ :page ].permit( Page.new.attributes.keys )
        end

    end
  end
end