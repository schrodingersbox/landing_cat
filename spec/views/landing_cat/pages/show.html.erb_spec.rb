require 'spec_helper'

describe 'landing_cat/pages/show' do

  helper LandingCat::GoogleAnalyticsHelper

  let( :page ) { FactoryGirl.build( :page ) }

  before(:each) do
    stub_view_routes
    assign( :page, page )
  end

  it 'renders' do
    render
  end
end
