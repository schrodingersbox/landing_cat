require 'spec_helper'

describe LandingCat::Config do

  let( :config ) { LandingCat::Config.instance }

  it 'is a singleton' do
    expect( config ).to be( LandingCat::Config.instance )
  end

  describe 'attributes' do

    it 'has an #admin_layout accessor' do
      expect( config.admin_layout ).to_not be_nil
      config.admin_layout = config.admin_layout
      expect( config.admin_layout ).to eql( config.admin_layout )
    end

    it 'has a #public_layout accessor' do
      expect( config.public_layout ).to_not be_nil
      config.public_layout = config.public_layout
      expect( config.public_layout ).to eql( config.public_layout )
    end

    it 'has a #lead_after_create accessor' do
      expect( config.lead_after_create ).to_not be_nil
      config.lead_after_create = config.lead_after_create
      expect( config.lead_after_create ).to eql( config.lead_after_create )
    end

  end

end

