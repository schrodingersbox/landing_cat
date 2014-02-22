require 'spec_helper'

describe 'landing_cat/admin/pages/index' do

  let( :experiment ) { SplitCat::Experiment.create( :name => 'foo' ) }
  let( :page ) { FactoryGirl.create( :page, :experiment => experiment ) }

  before(:each) do
    expect( page ).to be_present
    assign( :pages, Page.all )
  end

  it 'renders a list of pages' do
    render
  end
end
