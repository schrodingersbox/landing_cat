require 'spec_helper'

describe 'landing_cat/pages/show' do

  let( :experiment ) { FactoryGirl.create( :experiment ) }
  let( :page ) { FactoryGirl.create( :page, :experiment => experiment  ) }

  before(:each) do
    assign( :page, page )
    assign( :lead, LandingCat::Lead.new )
  end

  it 'renders' do
    render
  end

  it 'posts to create a landing' do
    render
    expect( rendered ).to have_selector( :form, :action => landing_cat.leads_path, :method => 'post' )
  end

  it 'includes the experiment name as a hidden field' do
    render
    expect( rendered ).to have_selector( :input, :type => 'hidden', :name => 'experiment', :value => experiment.name )
  end

end
