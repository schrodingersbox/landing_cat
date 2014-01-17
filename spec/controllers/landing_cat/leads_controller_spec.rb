require 'spec_helper'

include LandingCat

describe LandingCat::LeadsController do

  routes { LandingCat::Engine.routes }

  let( :lead ) { FactoryGirl.create( :lead ) }
  let( :cookie ) { SpecCat.read( 'spec/fixtures/cookie.txt' ) }
  let( :cookies ) { { Campaign::UTMZ => cookie } }
  let(:valid_attributes) { { :email => 'foo@bar.com'  } }

  describe 'POST create' do

    it 'creates a new Lead' do
      expect {
        post :create, {:lead => valid_attributes}
      }.to change(Lead, :count).by(1)
    end

    it 'updates an existing Lead' do
      expect( lead ).to be_present
      expect( Lead.count ).to eql( 1 )
      post :create, {:lead => { :email => lead.email } }
      expect( Lead.count ).to eql( 1 )
    end

    it 'assigns a campaign' do
      request.cookies[ Campaign::UTMZ ] = cookie
      post :create, {:lead => valid_attributes}
      expect( Lead.last.campaign ).to be_present
      expect_campaign_to_match_cookie( Lead.last.campaign )
    end

    it 'assigns a newly created lead as @lead' do
      post :create, {:lead => valid_attributes}
      expect( assigns(:lead) ).to be_a(Lead)
      expect( assigns(:lead) ).to be_persisted
    end

    it 'renders the create page' do
      post :create, {:lead => valid_attributes}
      expect( response ).to render_template( 'create' )
    end

  end

end

