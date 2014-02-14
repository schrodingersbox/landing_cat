require 'spec_helper'

include LandingCat

describe LandingCat::Admin::CampaignsController do

  routes { LandingCat::Engine.routes }

  let( :campaign ) { FactoryGirl.create( :campaign ) }

  before( :each ) do
    expect( campaign ).to be_present
  end

  it 'is a subclass of LandingCat::AdminController' do
    expect( @controller ).to be_a_kind_of( LandingCat::AdminController )
  end

  describe 'GET index' do

    it 'assigns all campaigns as @campaigns' do
      get :index
      expect( assigns(:campaign) ).to be_a_new( Campaign )
      expect( assigns(:campaigns) ).to eq([campaign])
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
