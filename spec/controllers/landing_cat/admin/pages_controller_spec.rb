require 'spec_helper'

include LandingCat

describe LandingCat::Admin::PagesController do

  routes { LandingCat::Engine.routes }

  let( :page ) { FactoryGirl.create( :page ) }

  let( :valid_attributes ) { { 'name' => 'test' } }

  before( :each ) do
    expect( page ).to be_present
  end

  describe 'GET index' do
    it 'assigns all pages as @pages' do
      get :index, {}
      expect( assigns( :pages ) ).to eq( [ page ] )
    end
  end

  describe 'GET show' do
    it 'assigns the requested page as @page' do
      get :show, {:id => page.to_param }
      expect( assigns( :page ) ).to eq( page )
    end
  end

  describe 'GET new' do
    it 'assigns a new page as @page' do
      get :new
      expect( assigns( :page ) ).to be_a_new( Page )
    end
  end

  describe 'GET edit' do
    it 'assigns the requested page as @page' do
      get :edit, { :id => page.to_param }
      expect( assigns( :page ) ).to eq( page )
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

      it 'redirects to the created page' do
        post :create, { :page => valid_attributes }
        expect( response ).to redirect_to( admin_page_path( Page.last ) )
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved page as @page' do
        # Trigger the behavior that occurs when invalid params are submitted
        Page.any_instance.stub(:save).and_return(false)
        post :create, { :page => {} }
        expect( assigns( :page ) ).to be_a_new( Page )
      end

      it 're-renders the new template' do
        # Trigger the behavior that occurs when invalid params are submitted
        Page.any_instance.stub(:save).and_return(false)
        post :create, { :page => {} }
        expect( response ).to render_template( 'new' )
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested page' do
        # Assuming there are no other pages in the database, this
        # specifies that the Page created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Page.any_instance.should_receive(:update).with( valid_attributes )
        put :update, {:id => page.to_param, :page => valid_attributes }
      end

      it 'assigns the requested page as @page' do
        put :update, { :id => page.to_param, :page => valid_attributes }
        expect( assigns( :page ) ).to eq(page)
      end

      it 'redirects to the page' do
        put :update, { :id => page.to_param, :page => valid_attributes }
        expect( response ).to redirect_to( admin_page_path( page ) )
      end
    end

    describe 'with invalid params' do
      it 'assigns the page as @page' do
        # Trigger the behavior that occurs when invalid params are submitted
        Page.any_instance.stub(:save).and_return(false)
        put :update, {:id => page.to_param, :page => {} }
        expect( assigns(:page) ).to eq(page)
      end

      it 're-renders the edit template' do
        # Trigger the behavior that occurs when invalid params are submitted
        Page.any_instance.stub(:save).and_return(false)
        put :update, { :id => page.to_param, :page => {} }
        expect( response ).to render_template( 'edit' )
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
