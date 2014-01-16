require 'spec_helper'

describe LandingCat::Admin::CampaignsController do
  describe "routing" do

    routes { LandingCat::Engine.routes }

    it "routes to #index" do
      expect( get('/admin/campaigns') ).to route_to('landing_cat/admin/campaigns#index')
    end

  end
end
