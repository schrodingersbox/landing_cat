require 'spec_helper'

describe LandingCat::ApplicationController do

  it 'is a subclass of ActionController::Base' do
    expect( @controller ).to be_a_kind_of( ActionController::Base )
  end

end