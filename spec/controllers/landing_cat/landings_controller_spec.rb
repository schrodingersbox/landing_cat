require 'spec_helper'

describe LandingCat::LandingsController do

  it 'is a subclass of ApplicationController' do
    expect( @controller ).to be_a_kind_of( ApplicationController )
  end

  describe '#show' do

    it 'gets' do
      get :show, :use_route => :landing_cat
      expect( response ).to be_success
    end

  end

end