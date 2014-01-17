require 'spec_helper'

include LandingCat

describe LandingCat::LeadsController do

  routes { LandingCat::Engine.routes }

  # This should return the minimal set of attributes required to create a valid
  # Lead. As you add validations to Lead, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { :email => 'foo@bar.com'  } }

  describe 'POST create' do
    it 'creates a new Lead' do
      expect {
        post :create, {:lead => valid_attributes}
      }.to change(Lead, :count).by(1)
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

