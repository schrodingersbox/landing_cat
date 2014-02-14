module LandingCat
  class PublicController < ApplicationController

    layout :set_layout

    def set_layout
      return LandingCat.config.public_layout
    end

  end
end