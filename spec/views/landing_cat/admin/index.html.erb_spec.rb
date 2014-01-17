require 'spec_helper'

describe 'landing_cat/admin/index' do

  before(:each) do
    stub_view_routes
  end

  it 'renders an index' do
    render
  end
end
