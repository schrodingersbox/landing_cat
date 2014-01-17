module LandingCat
  class Page < ActiveRecord::Base
    has_many :leads

    validates_presence_of :name
    validates_uniqueness_of :name

    before_save :underscore_name

    def underscore_name
      self.name = self.name.underscore.gsub( /\s/, '_' )
    end

  end
end