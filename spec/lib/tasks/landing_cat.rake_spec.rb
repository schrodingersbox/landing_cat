require 'spec_helper'
require 'rake'

describe 'landing_cat rake tasks' do

  before( :each ) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake::Task.define_task(:environment)
    load 'lib/tasks/landing_cat.rake'
  end

  it 'has no rake tasks' do

  end

end
