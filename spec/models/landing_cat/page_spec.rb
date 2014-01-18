require 'spec_helper'

include LandingCat

describe LandingCat::Page do

  let( :page ) { FactoryGirl.create( :page ) }

  it ( 'has many leads' ) { should have_many( :leads ) }
  it ( 'belongs to an experiment' ) { should belong_to( :experiment ) }

  describe 'schema' do

    it 'has columns' do
      should have_db_column( :id ).of_type( :integer )
      should have_db_column( :experiment_id ).of_type( :integer )
      should have_db_column( :experiment_type ).of_type( :string )
      should have_db_column( :weight ).of_type( :integer )
      should have_db_column( :heading ).of_type( :string )
      should have_db_column( :prompt ).of_type( :string )
      should have_db_column( :call_to_action ).of_type( :string )
      should have_db_column( :body ).of_type( :text )
    end

    it 'has indexes' do
      should have_db_index( [ :experiment_id, :experiment_type ] ).unique( true )
    end

  end

  it 'validates the uniqueness of experiment type, scoped by experiment id'

end
