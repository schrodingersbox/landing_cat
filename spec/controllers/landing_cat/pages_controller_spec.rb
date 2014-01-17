require 'spec_helper'

describe LandingCat::PagesController do

  routes { LandingCat::Engine.routes }

  let( :page ) { FactoryGirl.create( :page ) }

  before( :each ) do
    expect( page ).to be_present
  end

  describe "GET show" do

    it "assigns the requested page as @page" do
      get :show, { :id => page.to_param }
      expect( assigns( :page ) ).to eq( page )
    end

    it "accepts name as a lookup parameter" do
      get :show, { :name => page.name }
      expect( assigns( :page ) ).to eq( page )
    end

  end

end

