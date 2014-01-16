require 'spec_helper'

describe 'layouts/landing_cat/application.html.erb' do

  it 'includes a title' do
    render
    rendered.should have_selector( :title, :content => 'LandingCat' )
  end

end