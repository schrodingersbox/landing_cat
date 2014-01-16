# This migration comes from landing_cat (originally 20140116080545)
class CreateLandingCatTables < ActiveRecord::Migration
  def change

    create_table :landing_cat_campaigns do |t|
      t.string :utmcsr
      t.string :utmcmd
      t.string :utmctr
      t.string :utmcct
      t.string :utmccn
      t.boolean :utmgclid
      t.datetime :created_at

      t.index [ :utmcsr, :utmcmd, :utmctr, :utmcct, :utmccn ], :name => :everything
    end

    create_table :landing_cat_leads do |t|
      t.string :email, :null => false
      t.integer :campaign_id
      t.integer :page_id
      t.datetime :created_at

      t.index :email
      t.index :page_id
      t.index :campaign_id
    end

    create_table :landing_cat_pages do |t|
      t.string  :name, :null => false
      t.string :experiment_id
      t.boolean :a, :default => false
      t.boolean :b, :default => false
      t.boolean :multivariate, :default => false
      t.string :heading
      t.string :action
      t.text :body

      t.index :name
    end

  end
end
