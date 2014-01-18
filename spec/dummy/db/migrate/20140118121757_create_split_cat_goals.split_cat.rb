# This migration comes from split_cat (originally 20130909061026)
class CreateSplitCatGoals < ActiveRecord::Migration
  def change
    create_table :split_cat_goals do |t|
      t.integer :experiment_id
      t.string :name, :null => false
      t.string :description
      t.datetime :created_at

      t.index [ :experiment_id, :name ], :unique => true
    end
  end
end
