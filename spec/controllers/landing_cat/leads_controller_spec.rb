require 'spec_helper'

include LandingCat

describe LandingCat::LeadsController do

  routes { LandingCat::Engine.routes }

  let( :lead ) { FactoryGirl.create( :lead ) }
  let( :experiment ) { FactoryGirl.create( :experiment ) }
  let( :page ) { FactoryGirl.create( :page, :experiment => experiment ) }

  let( :cookie ) { SpecCat.read( 'spec/fixtures/cookie.txt' ) }
  let( :cookies ) { { Campaign::UTMZ => cookie } }

  let( :valid_attributes ) { { :email => 'foo@bar.com', :message => 'This is only a test', :page_id => page.id } }
  let( :valid_params ) { { :lead => valid_attributes, :experiment => experiment.name } }

  it 'is a subclass of LandingCat::AdminController' do
    expect( @controller ).to be_a_kind_of( LandingCat::PublicController )
  end

  describe 'POST create' do

    it 'creates a new Lead' do
      Lead.delete_all
      expect {
        post :create, valid_params
      }.to change(Lead, :count).by(1)

      test = Lead.first
      expect( test.email ).to eql( valid_attributes[ :email ] )
      expect( test.message ).to eql( valid_attributes[ :message ] )
      expect( test.page_id ).to eql( valid_attributes[ :page_id ] )
    end

    it 'updates an existing Lead' do
      expect( lead ).to be_present
      expect( Lead.count ).to eql( 1 )
      post :create, valid_params
      expect( Lead.count ).to eql( 1 )
    end

    it 'assigns a campaign' do
      request.cookies[ Campaign::UTMZ ] = cookie
      post :create, valid_params
      expect( Lead.last.campaign ).to be_present
      expect_campaign_to_match_cookie( Lead.last.campaign )
    end

    it 'assigns a newly created lead as @lead' do
      post :create, valid_params
      expect( assigns(:lead) ).to be_a(Lead)
      expect( assigns(:lead) ).to be_persisted
    end

    it 'reads the split cat token' do
      token = 'foobar'
      request.cookies[ :split_cat_token ] = token
      post :create, valid_params
      expect( assigns[ :split_cat_token ] ).to eql( token )
    end

    it 'records a goal for the experiment' do
      token = 'foobar'
      request.cookies[ :split_cat_token ] = token
      controller.should_receive( :split_cat_goal ).with( experiment.name,  Page::EXPERIMENT_GOAL, token )
      post :create, valid_params
    end

    it 'renders the create page' do
      post :create, valid_params
      expect( response ).to render_template( 'create' )
    end

    it 'renders with the configured layout' do
      post :create, valid_params
      expect( response ).to render_template( LandingCat.config.public_layout )
    end

  end

end

