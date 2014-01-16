require 'spec_helper'

describe LandingCat::Engine do

  it 'isolates the MeterCat namespace' do
    expect( LandingCat::Engine.isolated ).to be_true
  end

end