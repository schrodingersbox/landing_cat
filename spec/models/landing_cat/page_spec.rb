require 'spec_helper'

describe LandingCat::Page do

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
      should have_db_column( :action ).of_type( :string )
      should have_db_column( :body ).of_type( :text )
    end

    it 'has indexes' do
      should have_db_index( :name )
    end

  end

end
