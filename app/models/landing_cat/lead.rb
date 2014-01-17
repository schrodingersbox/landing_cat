module LandingCat
  class Lead < ActiveRecord::Base

    belongs_to :page
    belongs_to :campaign

    validates_uniqueness_of :email

  end
end