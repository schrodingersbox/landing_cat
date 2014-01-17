require 'spec_helper'

include LandingCat

describe LandingCat::Admin::CampaignsController do

  routes { LandingCat::Engine.routes }

  let( :campaign ) { FactoryGirl.create( :campaign ) }

  before( :each ) do
    expect( campaign ).to be_present
  end

  describe 'GET index' do
    it 'assigns all campaigns as @campaigns' do
      get :index, {}
      expect( assigns(:campaign) ).to be_a_new( Campaign )
      expect( assigns(:campaigns) ).to eq([campaign])
    end
  end

end
