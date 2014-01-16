require "spec_helper"

describe Admin::CampaignsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/campaigns").should route_to("admin/campaigns#index")
    end

  end
end
