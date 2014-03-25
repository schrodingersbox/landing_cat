require 'singleton'

module LandingCat

  class Config
    include Singleton

    NIL_PROC = proc {}

    attr_accessor :admin_layout, :public_layout
    attr_accessor :lead_after_create

    def authorize_with(&block)
      @authorize = block if block
      @authorize || NIL_PROC
    end

  end
end
