require 'spec_helper'

describe LandingCat::ExperimentsController do

  routes { LandingCat::Engine.routes }

  let( :experiment ) { FactoryGirl.create( :experiment ) }
  let( :page ) { FactoryGirl.create( :page, :experiment => experiment ) }

  before( :each ) do
    expect( experiment ).to be_present
    expect( page ).to be_present
  end

  it 'is a subclass of LandingCat::AdminController' do
    expect( @controller ).to be_a_kind_of( LandingCat::PublicController )
  end

  describe "GET show" do

    it 'looks up the experiment by id' do
      get :show, { :id => experiment.to_param }
      expect( assigns( :experiment ) ).to eq( experiment )
    end

    it 'looks up the experiment by name' do
      get :show, { :name => experiment.name }
      expect( assigns( :experiment ) ).to eq( experiment )
    end

    it "assigns the requested experiment as @experiment" do
      get :show, { :id => experiment.to_param }
      expect( assigns( :experiment ) ).to eq( experiment )
    end

    it 'cookies the user' do
      get :show, { :id => experiment.to_param }
      expect( assigns( :split_cat_token ) ).to be_present
      expect( response.cookies[ :split_cat_token.to_s ] ).to be_present
    end

    it 'assigns a new hypothesis' do
      get :show, { :id => experiment.to_param }
      expect( assigns( :hypothesis ) ).to be_present
    end

    it 'looks up an existing hypothesis' do
      token = split_cat_token
      hypothesis = split_cat_hypothesis( experiment.name, token )
      response.cookies[ :split_cat_token.to_s ] = token
      get :show, { :id => experiment.to_param }
      expect( assigns( :hypothesis ) ).to eql( hypothesis )
    end

    it 'renders the page' do
      get :show, { :id => experiment.to_param }
      expect( response ).to render_template( 'landing_cat/pages/show' )
    end

    it 'renders with the configured layout' do
      get :show, { :id => experiment.to_param }
      expect( response ).to render_template( LandingCat.config.public_layout )
    end

  end

end

