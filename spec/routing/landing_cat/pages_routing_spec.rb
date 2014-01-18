require 'spec_helper'

describe LandingCat::PagesController do
  describe 'routing' do

    routes { LandingCat::Engine.routes }

    it 'routes to #show' do
      expect( get('/pages/1') ).to route_to('landing_cat/pages#show', :id => '1')
    end

  end
end

