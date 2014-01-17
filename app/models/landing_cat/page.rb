module LandingCat
  class Page < ActiveRecord::Base
    has_many :leads

    validates_uniqueness_of :name
  end
end