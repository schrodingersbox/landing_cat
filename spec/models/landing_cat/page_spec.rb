require 'spec_helper'

include LandingCat

describe LandingCat::Page do

  let( :page ) { FactoryGirl.create( :page ) }

  it ( 'has many leads' ) { should have_many( :leads ) }

  describe 'schema' do

    it 'has columns' do
      should have_db_column( :id ).of_type( :integer )
      should have_db_column( :name ).of_type( :string )
      should have_db_column( :experiment_id ).of_type( :string )
      should have_db_column( :a ).of_type( :boolean )
      should have_db_column( :b ).of_type( :boolean )
      should have_db_column( :multivariate ).of_type( :boolean )
      should have_db_column( :heading ).of_type( :string )
      should have_db_column( :prompt ).of_type( :string )
      should have_db_column( :call_to_action ).of_type( :string )
      should have_db_column( :body ).of_type( :text )
    end

    it 'has indexes' do
      should have_db_index( :name ).unique( true )
    end

  end

  it 'validates the uniqueness of name' do
    expect( page ).to be_present

    test = Page.new( :name => page.name )
    expect( test.valid? ).to be_false
    expect( test.errors_on( :name ) ).to be_present
  end

end
