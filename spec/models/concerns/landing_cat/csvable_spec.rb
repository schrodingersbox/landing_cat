require 'spec_helper'

describe LandingCat::Csvable do

  let( :csv_class ) do
    Class.new( ActiveRecord::Base ) do
      include LandingCat::Csvable
      self.table_name = 'landing_cat_campaigns'
    end
  end

  let( :csv_object ) { csv_class.new { |o| o.id = 727} }

  let( :csv_path ) { 'spec/data/csvable.csv' }

  it 'extends ActiveSupport::Concern' do
    should be_a_kind_of( ActiveSupport::Concern )
  end

  it '::attribute_keys' do
    expected = csv_class.new.attributes.keys.sort.map { |name| name.to_sym }
    expect( csv_class.attribute_keys ).to eql( expected )
  end

  describe '::to_csv' do

    it 'generates csv' do
      expect( csv_class.to_csv( [ csv_object ] ) ).to eql_file( csv_path )
    end

  end

end