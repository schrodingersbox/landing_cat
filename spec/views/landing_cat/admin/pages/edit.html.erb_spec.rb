require 'spec_helper'

describe 'landing_cat/admin/pages/edit' do

  let( :page ) { FactoryGirl.build( :page ) }

  before( :each ) do
    stub_view_routes
    assign( :page, page )
  end

  it 'renders the edit page form' do
    render
  end
end
