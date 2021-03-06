require 'spec_helper'

include LandingCat

describe LandingCat::Lead do

  let( :lead ) { FactoryGirl.create( :lead ) }

  describe 'associations' do

    it ( 'belongs to a campaign' ) { should belong_to( :campaign ) }
    it ( 'belongs to a page' ) { should belong_to( :page ) }

  end

  describe 'schema' do

    it 'has columns' do
      should have_db_column( :id ).of_type( :integer )
      should have_db_column( :email ).of_type( :string )
      should have_db_column( :first_name ).of_type( :string )
      should have_db_column( :last_name ).of_type( :string )
      should have_db_column( :message ).of_type( :string )
      should have_db_column( :campaign_id ).of_type( :integer )
      should have_db_column( :page_id ).of_type( :integer )
      should have_db_column( :created_at ).of_type( :datetime )
    end

    it 'has indexes' do
      should have_db_index( :email ).unique( true )
      should have_db_index( :campaign_id )
      should have_db_index( :page_id )
    end

  end

  it 'validates the uniqueness of email' do
    expect( lead ).to be_present

    test = Lead.new( :email => lead.email )
    expect( test.valid? ).to be_false
    expect( test.errors_on( :email ) ).to be_present
  end

end
