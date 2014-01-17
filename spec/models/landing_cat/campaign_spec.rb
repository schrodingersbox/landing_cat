require 'spec_helper'

include LandingCat

describe LandingCat::Campaign do

  let( :campaign ) { FactoryGirl.create( :campaign ) }
  let( :cookie ) { SpecCat.read( 'spec/fixtures/cookie.txt' ) }
  let( :cookies ) { { Campaign::UTMZ => cookie } }

  it ( 'has many leads' ) { should have_many( :leads ) }

  describe 'schema' do

    it 'has columns' do
      should have_db_column( :id ).of_type( :integer )
      should have_db_column( :utmcsr ).of_type( :string )
      should have_db_column( :utmcmd ).of_type( :string )
      should have_db_column( :utmctr ).of_type( :string )
      should have_db_column( :utmcct ).of_type( :string )
      should have_db_column( :utmccn ).of_type( :string )
      should have_db_column( :utmgclid ).of_type( :string )
      should have_db_column( :created_at ).of_type( :datetime )
    end

    it 'has indexes' do
      should have_db_index( [ :utmcsr, :utmcmd, :utmctr, :utmcct, :utmccn, :utmgclid ] ).unique( true )
    end

  end

  describe '#parse_cookies' do

    it 'always returns itself' do
      expect( campaign.parse_cookies( nil ) ).to be( campaign )
      expect( campaign.parse_cookies( { Campaign::UTMZ => nil } ) ).to be( campaign )
      expect( campaign.parse_cookies( { Campaign::UTMZ => '' } ) ).to be( campaign )
      expect( campaign.parse_cookies( cookies ) ).to be( campaign )
    end

    it 'reads Google __utmz cookies' do
      campaign.parse_cookies( cookies )
      expect_campaign_to_match_cookie( campaign )
    end

  end

  describe '::find_or_create_by_cookies' do

    it 'returns a new record, if not found' do
      expect( Campaign.count ).to eql( 0 )
      campaign = Campaign.find_or_create_by_cookies( cookies )
      expect( Campaign.count ).to eql( 1 )
      expect_campaign_to_match_cookie( campaign )
    end

    it 'returns an existing record, if found' do
      expect( Campaign.count ).to eql( 0 )
      campaign1 = Campaign.find_or_create_by_cookies( cookies )
      campaign2 = Campaign.find_or_create_by_cookies( cookies )
      expect( Campaign.count ).to eql( 1 )

      expect( campaign1.id ).to eql( campaign2.id )
      expect_campaign_to_match_cookie( campaign2 )
    end

  end

end
