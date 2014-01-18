require 'spec_helper'

describe LandingCat::Config do

  let( :config ) { LandingCat::Config.instance }

  it 'is a singleton' do
    expect( config ).to be( LandingCat::Config.instance )
  end

  describe 'attributes' do

    it 'has a #tracking_id accessor' do
      expect( config.tracking_id ).to_not be_nil
      config.tracking_id = config.tracking_id
      expect( config.tracking_id ).to eql( config.tracking_id )
    end

  end

end