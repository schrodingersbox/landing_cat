require 'spec_helper'

include LandingCat

describe LandingCat::Admin::PagesController do

  routes { LandingCat::Engine.routes }

  let( :experiment ) { FactoryGirl.create( :experiment ) }
  let( :page ) { FactoryGirl.create( :page, :experiment => experiment ) }

  let( :valid_attributes ) { { 'experiment_type' => 'c', :experiment_id => experiment.id.to_s } }

  before( :each ) do
    expect( page ).to be_present
  end

  it 'is a subclass of LandingCat::AdminController' do
    expect( @controller ).to be_a_kind_of( LandingCat::AdminController )
  end

  describe 'GET index' do

    it 'assigns all pages as @pages' do
      get :index, {}
      expect( assigns( :pages ) ).to eq( [ page ] )
    end

    it 'renders with the configured layout' do
      get :index, {}
      expect( response ).to render_template( LandingCat.config.layout_admin )
    end

  end

  describe 'GET new' do

    it 'assigns a new page as @page' do
      get :new
      expect( assigns( :page ) ).to be_a_new( Page )
    end

    it 'renders with the configured layout' do
      get :new
      expect( response ).to render_template( LandingCat.config.layout_admin )
    end

  end

  describe 'GET edit' do

    it 'assigns the requested page as @page' do
      get :edit, { :id => page.to_param }
      expect( assigns( :page ) ).to eq( page )
    end

    it 'renders with the configured layout' do
      get :edit, { :id => page.to_param }
      expect( response ).to render_template( LandingCat.config.layout_admin )
    end

  end

  describe 'POST create' do

    describe 'with valid params' do

      it 'creates a new Page' do
        expect {
          post :create, { :page => valid_attributes }
        }.to change( Page, :count ).by( 1 )
      end

      it 'assigns a newly created page as @page' do
        post :create, { :page => valid_attributes }
        expect( assigns( :page ) ).to be_a( Page )
        expect( assigns( :page ) ).to be_persisted
      end

      it 'redirects to the page list' do
        post :create, { :page => valid_attributes }
        expect( response ).to redirect_to( admin_pages_path )
      end

    end

    describe 'with invalid params' do

      before( :each ) do
        Page.any_instance.stub(:save).and_return(false)
      end

      it 'assigns a newly created but unsaved page as @page' do
        post :create, { :page => {} }
        expect( assigns( :page ) ).to be_a_new( Page )
      end

      it 're-renders the new template' do
        post :create, { :page => {} }
        expect( response ).to render_template( 'new' )
      end

      it 'renders with the configured layout' do
        post :create, { :page => {} }
        expect( response ).to render_template( LandingCat.config.layout_admin )
      end

    end

  end

  describe 'PUT update' do

    describe 'with valid params' do

      it 'updates the requested page' do
        Page.any_instance.should_receive(:update).with( hash_including( valid_attributes ) )
        put :update, {:id => page.to_param, :page => valid_attributes }
      end

      it 'assigns the requested page as @page' do
        put :update, { :id => page.to_param, :page => valid_attributes }
        expect( assigns( :page ) ).to eq( page )
      end

      it 'redirects to the page list' do
        put :update, { :id => page.to_param, :page => valid_attributes }
        expect( response ).to redirect_to( admin_pages_path )
      end

    end

    describe 'with invalid params' do

      before( :each ) do
        Page.any_instance.stub(:save).and_return(false)
      end

      it 'assigns the page as @page' do
        put :update, {:id => page.to_param, :page => {} }
        expect( assigns(:page) ).to eq(page)
      end

      it 're-renders the edit template' do
        put :update, { :id => page.to_param, :page => {} }
        expect( response ).to render_template( 'edit' )
      end

      it 'renders with the configured layout' do
        put :update, { :id => page.to_param, :page => {} }
        expect( response ).to render_template( LandingCat.config.layout_admin )
      end

    end

  end

  describe 'DELETE destroy' do

    it 'destroys the requested page' do
      expect {
        delete :destroy, { :id => page.to_param }
      }.to change( Page, :count ).by( -1 )
    end

    it 'redirects to the pages list' do
      delete :destroy, { :id => page.to_param }
      expect( response ).to redirect_to( admin_pages_url )
    end

  end

end

