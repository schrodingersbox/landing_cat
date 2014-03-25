module LandingCat
  class AdminController < ApplicationController

    layout :set_layout
    before_filter :_authorize!

    def index
    end

    def set_layout
      return LandingCat.config.admin_layout
    end

    def _authorize!
      instance_eval(&LandingCat.config.authorize_with)
    end

  end
end