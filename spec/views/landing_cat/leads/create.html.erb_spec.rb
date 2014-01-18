require 'spec_helper'

describe 'landing_cat/leads/create' do

  helper LandingCat::GoogleAnalyticsHelper

  before(:each) do
    stub_view_routes
  end

  it 'renders' do
    render
  end
end
