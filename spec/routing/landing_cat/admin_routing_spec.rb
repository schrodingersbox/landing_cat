require 'spec_helper'

describe LandingCat::AdminController do
  describe 'routing' do

    routes { LandingCat::Engine.routes }

    it 'routes to #index' do
      expect( get('/admin') ).to route_to('landing_cat/admin#index')
    end

  end
end

