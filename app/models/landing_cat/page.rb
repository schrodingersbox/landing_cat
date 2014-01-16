module LandingCat
  class Page < ActiveRecord::Base
    has_many :leads
  end
end