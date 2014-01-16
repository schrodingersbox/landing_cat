module LandingCat
  class Lead < ActiveRecord::Base
    belongs_to :page
    belongs_to :campaign
  end
end