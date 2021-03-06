require 'spec_helper'

describe "landing_cat/admin/leads/index" do

  let( :lead ) { FactoryGirl.create( :lead ) }

  before(:each) do
    expect( lead ).to be_present
    assign( :leads, LandingCat::Lead.all.page )
  end

  it "renders a list of leads" do
    render
  end
end
