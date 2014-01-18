require 'singleton'

module LandingCat

  class Config
    include Singleton

    attr_accessor :tracking_id, :domain

  end

end