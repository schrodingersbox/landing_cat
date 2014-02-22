require 'spec_helper'

describe "landing_cat/admin/campaigns/index" do

  let( :campaign ) { FactoryGirl.create( :campaign ) }

  before(:each) do
    expect( campaign ).to be_present
    assign(:campaigns, Campaign.all.page )
  end

  it "renders a list of campaigns" do
    render
  end

end
