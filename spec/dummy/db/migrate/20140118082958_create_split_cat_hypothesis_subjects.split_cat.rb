# This migration comes from split_cat (originally 20130909061034)
class CreateSplitCatHypothesisSubjects < ActiveRecord::Migration
  def change
    create_table :split_cat_hypothesis_subjects do |t|
      t.integer :hypothesis_id
      t.integer :subject_id
      t.integer :experiment_id
      t.datetime :created_at

      t.index [ :experiment_id, :subject_id ], :unique => true, :name => 'index_split_cat_hs_on_experiment_id_and_subject_id'
    end
  end
end
