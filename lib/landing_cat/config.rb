require 'singleton'

module LandingCat

  class Config
    include Singleton

    attr_accessor :layout_admin, :layout_public

  end
end
