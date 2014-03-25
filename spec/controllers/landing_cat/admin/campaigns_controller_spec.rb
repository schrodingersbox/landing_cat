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

    it 'uses the configured authorization' do
      expect( @controller ).to receive( :instance_eval ).with( &LandingCat.config.authorize_with )
      get :index
    end

    it 'responds to CSV' do
      get :index, { :format => :csv }
      expect( response ).to be_success
      expect( response.content_type ).to eql( 'text/csv' )
    end

  end

end
