module LandingCat
  class Lead < ActiveRecord::Base

    include Csvable

    belongs_to :page
    belongs_to :campaign

    validates_uniqueness_of :email

    after_create :was_created

    def was_created
      callback = LandingCat.config.lead_after_create
      callback.call( self ) if callback
    end

  end
end