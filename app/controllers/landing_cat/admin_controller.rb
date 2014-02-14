module LandingCat
  class AdminController < ApplicationController

    layout :set_layout

    def index
    end

    def set_layout
      return LandingCat.config.layout_admin
    end

  end
end