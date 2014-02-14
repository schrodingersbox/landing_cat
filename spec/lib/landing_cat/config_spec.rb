require 'spec_helper'

describe LandingCat::Config do

  let( :config ) { LandingCat::Config.instance }

  it 'is a singleton' do
    expect( config ).to be( LandingCat::Config.instance )
  end

  describe 'attributes' do

    it 'has an #layout_admin accessor' do
      expect( config.layout_admin ).to_not be_nil
      config.layout_admin = config.layout_admin
      expect( config.layout_admin ).to eql( config.layout_admin )
    end

    it 'has a #layout_public accessor' do
      expect( config.layout_public ).to_not be_nil
      config.layout_public = config.layout_public
      expect( config.layout_public ).to eql( config.layout_public )
    end

  end

end

