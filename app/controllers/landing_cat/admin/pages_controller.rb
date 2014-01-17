module LandingCat
  module Admin
    class PagesController < ApplicationController
      before_action :set_page, only: [:edit, :update, :destroy]

      # GET /pages
      def index
        @pages = Page.all.order( 'id desc' )
      end

      # GET /pages/new
      def new
        @page = Page.new
      end

      # GET /pages/1/edit
      def edit
      end

      # POST /pages
      def create
        @page = Page.new(page_params)

        if @page.save
          redirect_to admin_pages_path, notice: 'Page was successfully created.'
        else
          render action: 'new'
        end
      end

      # PATCH/PUT /pages/1
      def update
        if @page.update(page_params)
          redirect_to admin_pages_path, notice: 'Page was successfully updated.'
        else
          render action: 'edit'
        end
      end

      # DELETE /pages/1
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
          params[ :page ].permit( Page.new.attributes.keys ) if params[ :page ]
        end
    end
  end
end