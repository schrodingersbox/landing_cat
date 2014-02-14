module LandingCat
  class AdminController < ApplicationController

    layout :set_layout
    before_filter :use_before_filter

    def index
    end

    def set_layout
      return LandingCat.config.admin_layout
    end

    def use_before_filter
      send( LandingCat.config.admin_before_filter ) if LandingCat.config.admin_before_filter
    end

  end
end