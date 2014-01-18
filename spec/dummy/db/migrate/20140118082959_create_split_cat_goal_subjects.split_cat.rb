# This migration comes from split_cat (originally 20130909061041)
class CreateSplitCatGoalSubjects < ActiveRecord::Migration
  def change
    create_table :split_cat_goal_subjects do |t|
      t.integer :goal_id
      t.integer :subject_id
      t.integer :experiment_id
      t.integer :hypothesis_id
      t.datetime :created_at

      t.index :experiment_id
      t.index [ :goal_id, :subject_id ], :unique => true, :name => 'index_split_cat_gs_on_goal_id_and_subject_id'
    end
  end
end
