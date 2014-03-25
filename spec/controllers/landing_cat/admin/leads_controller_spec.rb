require 'spec_helper'

include LandingCat

describe LandingCat::Admin::LeadsController do

  routes { LandingCat::Engine.routes }

  let( :lead ) { FactoryGirl.create( :lead ) }

  before( :each ) do
    expect( lead ).to be_present
  end

  it 'is a subclass of LandingCat::AdminController' do
    expect( @controller ).to be_a_kind_of( LandingCat::AdminController )
  end

  describe 'GET index' do

    it 'assigns all leads as @leads' do
      get :index
      expect( assigns( :leads ) ).to eq( [ lead ] )
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

  describe 'GET show' do

    it 'assigns the requested lead as @lead' do
      get :show, { :id => lead.to_param }
      expect( assigns( :lead ) ).to eq( lead )
    end

    it 'renders with the configured layout' do
      get :show, { :id => lead.to_param }
      expect( response ).to render_template( LandingCat.config.admin_layout )
    end

    it 'uses the configured authorization' do
      expect( @controller ).to receive( :instance_eval ).with( &LandingCat.config.authorize_with )
      get :show, { :id => lead.to_param }
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

    it 'uses the configured authorization' do
      expect( @controller ).to receive( :instance_eval ).with( &LandingCat.config.authorize_with )
      delete :destroy, { :id => lead.to_param }
    end

  end

end

