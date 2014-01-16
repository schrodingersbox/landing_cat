require 'spec_helper'

describe LandingCat::Campaign do

  it ( 'has many leads' ) { should have_many( :leads ) }

  describe 'schema' do

    it 'has columns' do
      should have_db_column( :id ).of_type( :integer )
      should have_db_column( :utmcsr ).of_type( :string )
      should have_db_column( :utmcmd ).of_type( :string )
      should have_db_column( :utmctr ).of_type( :string )
      should have_db_column( :utmcct ).of_type( :string )
      should have_db_column( :utmccn ).of_type( :string )
      should have_db_column( :utmgclid ).of_type( :boolean )
      should have_db_column( :created_at ).of_type( :datetime )
    end

    it 'has indexes' do
      should have_db_index( [ :utmcsr, :utmcmd, :utmctr, :utmcct, :utmccn ] )
    end

  end

end
