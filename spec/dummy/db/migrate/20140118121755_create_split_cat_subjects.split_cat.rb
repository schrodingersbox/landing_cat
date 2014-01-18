# This migration comes from split_cat (originally 20130909061009)
class CreateSplitCatSubjects < ActiveRecord::Migration
  def change
    create_table :split_cat_subjects do |t|
      t.string :token
      t.datetime :created_at

      t.index :token, :unique => true
    end
  end
end
