require 'landing_cat/config'
require 'landing_cat/engine'

module LandingCat

  def self.config
    return LandingCat::Config.instance
  end

  def self.configure
    yield config
  end

end
