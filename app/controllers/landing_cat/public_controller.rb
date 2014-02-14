module LandingCat
  class PublicController < ApplicationController

    layout :set_layout

    def set_layout
      return LandingCat.config.layout_public
    end

  end
end