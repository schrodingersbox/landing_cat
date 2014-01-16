require 'spec_helper'

describe "landing_cat/admin/leads/index" do

  let( :lead ) { FactoryGirl.build( :lead ) }

  before(:each) do
    assign( :leads, [ lead, lead ] )
    view.stub( :admin_leads_path ).and_return( '/admin/leads' )
  end

  it "renders a list of leads" do
    render
  end
end
