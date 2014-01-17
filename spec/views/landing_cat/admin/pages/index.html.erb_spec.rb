require 'spec_helper'

describe 'landing_cat/admin/pages/index' do

  let( :page ) { FactoryGirl.build( :page ) }

  before(:each) do
    stub_view_routes
    assign( :pages, [ page, page ] )
  end

  it 'renders a list of pages' do
    render
  end
end
