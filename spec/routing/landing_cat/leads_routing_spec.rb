require 'spec_helper'

describe LandingCat::LeadsController do
  describe 'routing' do

    routes { LandingCat::Engine.routes }

    it 'routes to #create' do
      expect( post('/leads') ).to route_to('landing_cat/leads#create')
    end

  end
end

