require 'spec_helper'

describe LandingCat do

  it 'requires the engine' do
    expect( LandingCat::Engine ).to_not be_nil
  end

  it 'defines the MeterCat module' do
    expect( LandingCat ).to_not be_nil
  end

end