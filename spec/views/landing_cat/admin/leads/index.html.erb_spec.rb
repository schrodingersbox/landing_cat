require 'spec_helper'

describe "landing_cat/admin/leads/index" do

  let( :lead ) { FactoryGirl.build( :lead ) }

  before(:each) do
    stub_view_routes
    assign( :leads, [ lead, lead ] )
  end

  it "renders a list of leads" do
    render
  end
end
