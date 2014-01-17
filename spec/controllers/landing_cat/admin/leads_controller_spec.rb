require 'spec_helper'

include LandingCat

describe LandingCat::Admin::LeadsController do

  routes { LandingCat::Engine.routes }

  let( :lead ) { FactoryGirl.create( :lead ) }

  before( :each ) do
    expect( lead ).to be_present
  end

  describe 'GET index' do
    it 'assigns all leads as @leads' do
      get :index
      expect( assigns( :leads ) ).to eq( [ lead ] )
    end
  end

  describe 'GET show' do
    it 'assigns the requested lead as @lead' do
      get :show, { :id => lead.to_param }
      expect( assigns( :lead ) ).to eq( lead )
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested lead' do
      expect {
        delete :destroy, { :id => lead.to_param }
      }.to change( Lead, :count ).by( -1 )
    end

    it 'redirects to the leads list' do
      delete :destroy, { :id => lead.to_param }
      expect( response ).to redirect_to( admin_leads_url )
    end
  end

end

