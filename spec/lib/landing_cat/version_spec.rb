require 'spec_helper'

describe 'version' do

  it 'has a version constant' do
    expect( LandingCat::VERSION ).to_not be_nil
    expect( LandingCat::VERSION ).to be_an_instance_of( String )
    expect( LandingCat::VERSION ).to match( /\d+\.\d+\.\d+/ )
  end

end