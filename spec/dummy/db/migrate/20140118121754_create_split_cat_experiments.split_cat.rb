# This migration comes from split_cat (originally 20130909060959)
class CreateSplitCatExperiments < ActiveRecord::Migration
  def change
    create_table :split_cat_experiments do |t|
      t.string :name, :null => false
      t.string :description
      t.integer :winner_id
      t.datetime :created_at

      t.index :name, :unique => true
    end
  end
end
