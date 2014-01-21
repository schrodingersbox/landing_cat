require 'spec_helper'

include LandingCat

describe LandingCat::Page do

  let( :experiment ) { FactoryGirl.create( :experiment ) }
  let( :page ) { FactoryGirl.create( :page, :experiment => experiment ) }

  it ( 'has many leads' ) { should have_many( :leads ) }
  it ( 'belongs to an experiment' ) { should belong_to( :experiment ) }

  describe 'schema' do

    it 'has columns' do
      should have_db_column( :id ).of_type( :integer )
      should have_db_column( :experiment_id ).of_type( :integer )
      should have_db_column( :experiment_type ).of_type( :string )
      should have_db_column( :weight ).of_type( :integer )
      should have_db_column( :heading ).of_type( :string )
      should have_db_column( :prompt ).of_type( :string )
      should have_db_column( :call_to_action ).of_type( :string )
      should have_db_column( :body ).of_type( :text )
    end

    it 'has indexes' do
      should have_db_index( [ :experiment_id, :experiment_type ] ).unique( true )
    end

  end

  it 'defines a constant for the split test goal' do
    expect( Page::EXPERIMENT_GOAL ).to be( :clicked )
  end

  it 'validates the presence of experiment id' do
    page.experiment_id = nil
    expect( page.valid? ).to be_false
    expect( page.errors[ :experiment_id ] ).to be_present
  end

  it 'validates the presence of experiment type' do
    page.experiment_type = nil
    expect( page.valid? ).to be_false
    expect( page.errors[ :experiment_type ] ).to be_present
  end

  it 'validates the uniqueness of experiment type, scoped by experiment id' do
    test = Page.new( :experiment_id => page.experiment_id, :experiment_type => page.experiment_type )
    expect( test.valid? ).to be_false
    expect( test.errors[ :experiment_type ] ).to be_present

    test.experiment_type = 'foo'
    expect( test.valid? ).to be_true

    test = Page.new( :experiment_id => SplitCat::Experiment.create( :name => 'foo' ).id, :experiment_type => page.experiment_type )
    expect( test.valid? ).to be_true
  end

  it 'updates the experiment after save' do
    test = page.dup
    Page.delete_all
    expect( test ).to receive( :update_experiment )
    test.save
  end

  describe '#hypothesis' do

    it 'creates a hypothesis if one does not exist' do
      SplitCat::Hypothesis.delete_all
      expect( page.hypothesis ).to be_present
      expect( SplitCat::Hypothesis.count ).to eql( 1 )
      expect( page.hypothesis.name ).to eql( page.experiment_type )
      expect( page.hypothesis.weight ).to eql( page.weight )
    end

    it 'returns the existing hypothesis' do
      hypothesis = experiment.hypotheses.where( :name => page.experiment_type ).first
      expect( hypothesis ).to be_present
      expect( page.hypothesis ).to eql( hypothesis )
    end

  end

  describe '#update_experiment' do

    it 'tolerates a nil experiment' do
      page.experiment_id = nil
      page.update_experiment
    end

    it 'creates a hypothesis if one does not exist' do
      SplitCat::Hypothesis.delete_all
      page.update_experiment
      expect( SplitCat::Hypothesis.count ).to eql( 1 )
      expect( page.hypothesis.name ).to eql( page.experiment_type )
      expect( page.hypothesis.weight ).to eql( page.weight )
    end

    it 'updates the weight of the hypothesis' do
      expect( page.hypothesis ).to be_present
      page.hypothesis.update_attribute( :weight, nil )
      page.update_experiment
      expect( page.hypothesis.weight ).to eql( page.weight )
    end

    it 'creates a goal if one does not exist' do
      SplitCat::Goal.delete_all
      page.update_experiment
      expect( SplitCat::Goal.count ).to eql( 1 )
      expect( SplitCat::Goal.first.name ).to eql( Page::EXPERIMENT_GOAL.to_s )
    end

  end

end
