require 'spec_helper'

describe "landing_cat/admin/leads/show" do

  let( :lead ) { FactoryGirl.build( :lead ) }

  before(:each) do
    assign(:lead, lead)
    view.stub( :admin_leads_path ).and_return( '/admin/leads' )
  end

  it "renders" do
    render
  end
end
