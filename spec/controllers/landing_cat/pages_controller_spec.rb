require 'spec_helper'

describe LandingCat::PagesController do

  routes { LandingCat::Engine.routes }

  let( :experiment ) { FactoryGirl.create( :experiment ) }
  let( :page ) { FactoryGirl.create( :page, :experiment => experiment ) }

  before( :each ) do
    expect( page ).to be_present
  end

  it 'is a subclass of LandingCat::AdminController' do
    expect( @controller ).to be_a_kind_of( LandingCat::PublicController )
  end

  describe 'GET show' do

    it 'assigns the requested page as @page' do
      get :show, { :id => page.to_param }
      expect( assigns( :page ) ).to eq( page )
    end

    it 'renders with the configured layout' do
      get :show, { :id => page.to_param }
      expect( response ).to render_template( LandingCat.config.public_layout )
    end

  end

end

