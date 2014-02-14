require 'spec_helper'

describe LandingCat::PublicController do

  it 'is a subclass of ApplicationController' do
    expect( @controller ).to be_a_kind_of( ApplicationController )
  end

end