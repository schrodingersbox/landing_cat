require 'singleton'

module LandingCat

  class Config
    include Singleton

    attr_accessor :admin_before_filter, :admin_layout, :public_layout
    attr_accessor :lead_after_create

  end
end
