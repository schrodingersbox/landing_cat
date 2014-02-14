require 'spec_helper'

describe LandingCat::AdminController do

  it 'is a subclass of ApplicationController' do
    expect( @controller ).to be_a_kind_of( ApplicationController )
  end

  describe '#index' do

    it 'gets' do
      get :index, :use_route => :landing_cat
      expect( response ).to be_success
      expect( response ).to render_template( LandingCat.config.layout_admin )
    end

  end

end