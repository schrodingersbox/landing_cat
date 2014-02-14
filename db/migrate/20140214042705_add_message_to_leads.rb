class AddMessageToLeads < ActiveRecord::Migration
  def change
    add_column :landing_cat_leads, :message, :string
  end
end
