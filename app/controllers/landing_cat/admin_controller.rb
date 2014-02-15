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
      filter = LandingCat.config.admin_before_filter
      send( filter ) if filter
    end

  end
end