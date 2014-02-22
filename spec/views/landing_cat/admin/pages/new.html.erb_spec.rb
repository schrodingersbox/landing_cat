require 'spec_helper'

include LandingCat

describe 'landing_cat/admin/pages/new' do

  before( :each ) do
    assign( :page, Page.new )
  end

  it 'renders new page form' do
    render
  end
end
