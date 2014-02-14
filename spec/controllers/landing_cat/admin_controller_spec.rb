require 'spec_helper'

describe LandingCat::AdminController do

  routes { LandingCat::Engine.routes }

  it 'is a subclass of ApplicationController' do
    expect( @controller ).to be_a_kind_of( ApplicationController )
  end

  describe '#index' do

    it 'gets' do
      get :index
      expect( response ).to be_success
      expect( response ).to render_template( LandingCat.config.admin_layout )
    end

    it 'renders with the configured layout' do
      get :index
      expect( response ).to render_template( LandingCat.config.admin_layout )
    end

    it 'uses the configured before filter' do
      expect( @controller ).to receive( LandingCat.config.admin_before_filter )
      get :index
    end

  end

end