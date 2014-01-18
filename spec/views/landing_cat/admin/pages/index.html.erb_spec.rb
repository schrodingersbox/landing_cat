require 'spec_helper'

describe 'landing_cat/admin/pages/index' do

  let( :experiment ) { SplitCat::Experiment.new( :name => 'foo' ) }
  let( :page ) { FactoryGirl.build( :page, :experiment => experiment ) }

  before(:each) do
    stub_view_routes
    assign( :pages, [ page, page ] )
  end

  it 'renders a list of pages' do
    render
  end
end
