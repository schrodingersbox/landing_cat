require 'spec_helper'

describe LandingCat::Config do

  let( :config ) { LandingCat::Config.instance }

  it 'is a singleton' do
    expect( config ).to be( LandingCat::Config.instance )
  end

  describe 'attributes' do

    it 'has an #admin_before_filter accessor' do
      expect( config.admin_before_filter ).to_not be_nil
      config.admin_before_filter = config.admin_before_filter
      expect( config.admin_before_filter ).to eql( config.admin_before_filter )
    end

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

  end

end

