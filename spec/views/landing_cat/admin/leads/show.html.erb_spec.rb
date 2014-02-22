require 'spec_helper'

describe "landing_cat/admin/leads/show" do

  let( :lead ) { FactoryGirl.create( :lead ) }

  before(:each) do
    assign(:lead, lead)
  end

  it "renders" do
    render
  end
end
