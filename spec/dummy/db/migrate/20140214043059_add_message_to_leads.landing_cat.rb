# This migration comes from landing_cat (originally 20140214042705)
class AddMessageToLeads < ActiveRecord::Migration
  def change
    add_column :landing_cat_leads, :message, :string
  end
end
