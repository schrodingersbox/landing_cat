require 'spec_helper'

describe 'landing_cat/admin/pages/edit' do

  let( :experiment ) { FactoryGirl.create( :experiment ) }

  context 'with a new record' do

    before( :each ) do
      assign( :page, FactoryGirl.build( :page ) )
    end

    it 'renders the edit page form' do
      render
    end

  end

  context 'with an existing record' do

    before( :each ) do
      assign( :page, FactoryGirl.create( :page, :experiment => experiment ) )
    end

    it 'renders the edit page form' do
      render
    end

  end

end
