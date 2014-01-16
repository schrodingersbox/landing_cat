require 'spec_helper'

describe LandingCat::Admin::LeadsController do
  describe "routing" do

    routes { LandingCat::Engine.routes }

    it "routes to #index" do
      expect( get("/admin/leads") ).to route_to("landing_cat/admin/leads#index")
    end

    it "routes to #show" do
      expect( get("/admin/leads/1") ).to route_to("landing_cat/admin/leads#show", :id => "1")
    end

    it "routes to #destroy" do
      expect( delete("/admin/leads/1") ).to route_to("landing_cat/admin/leads#destroy", :id => "1")
    end

  end
end

