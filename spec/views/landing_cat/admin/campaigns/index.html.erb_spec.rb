require 'spec_helper'

describe "landing_cat/admin/campaigns/index" do

  let( :campaign ) { FactoryGirl.build( :campaign ) }

  before(:each) do
    assign(:campaigns, [campaign, campaign ] )
  end

  it "renders a list of campaigns" do
    render
  end

end
