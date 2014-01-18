# This migration comes from split_cat (originally 20130909061017)
class CreateSplitCatHypotheses < ActiveRecord::Migration
  def change
    create_table :split_cat_hypotheses do |t|
      t.integer :experiment_id
      t.string :name, :null => false
      t.string :description
      t.integer :weight
      t.datetime :created_at

      t.index [ :experiment_id, :name ], :unique => true
    end
  end
end
