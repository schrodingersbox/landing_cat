require 'spec_helper'

describe LandingCat do

  it 'requires the engine' do
    expect( LandingCat::Engine ).to_not be_nil
  end

  it 'defines the LandingCat module' do
    expect( LandingCat ).to_not be_nil
  end


  describe '::config' do

    it 'returns the configuration' do
      expect( LandingCat.config ).to be( LandingCat::Config.instance )
    end

  end

  describe '::configure' do

    it 'yields the configuration' do
      LandingCat.configure { |config| expect( config ).to be( LandingCat::Config.instance ) }
    end

  end

end