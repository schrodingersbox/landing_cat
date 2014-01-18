# This migration comes from landing_cat (originally 20140116080545)
class CreateLandingCatTables < ActiveRecord::Migration
  def change

    create_table :landing_cat_campaigns do |t|
      t.string :utmcsr
      t.string :utmcmd
      t.string :utmctr
      t.string :utmcct
      t.string :utmccn
      t.string :utmgclid
      t.datetime :created_at

      t.index [ :utmcsr, :utmcmd, :utmctr, :utmcct, :utmccn, :utmgclid ], :unique => true, :name => :index_landing_cat_campaigns_on_everything
    end

    create_table :landing_cat_leads do |t|
      t.string :email, :null => false
      t.integer :campaign_id
      t.integer :page_id
      t.datetime :created_at

      t.index :email, :unique => true
      t.index :page_id
      t.index :campaign_id
    end

    create_table :landing_cat_pages do |t|
      t.integer :experiment_id
      t.integer :weight
      t.string :experiment_type, :limit => 1
      t.string :heading
      t.string :prompt
      t.string :call_to_action
      t.text :body

      t.index [ :experiment_id, :experiment_type ], :unique => true
    end

  end
end
