require 'spec_helper'

describe LandingCat::PagesController do

  routes { LandingCat::Engine.routes }

  let( :experiment ) { FactoryGirl.create( :experiment ) }
  let( :page ) { FactoryGirl.create( :page, :experiment => experiment ) }

  before( :each ) do
    expect( page ).to be_present
  end

  describe 'GET show' do

    it 'assigns the requested page as @page' do
      get :show, { :id => page.to_param }
      expect( assigns( :page ) ).to eq( page )
    end

    it 'assigns a new lead' do
      get :show, { :id => page.to_param }
      expect( assigns( :lead ) ).to be_new_record
    end

  end

end

