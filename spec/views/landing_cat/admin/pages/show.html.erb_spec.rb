require 'spec_helper'

describe 'landing_cat/admin/pages/show' do

  let( :page ) { FactoryGirl.build( :page ) }

  before(:each) do
    stub_view_routes
    assign( :page, page )
  end

  it 'renders attributes in <p>' do
    render
  end
end
