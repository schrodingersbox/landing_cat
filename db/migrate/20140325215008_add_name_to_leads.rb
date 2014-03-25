class AddNameToLeads < ActiveRecord::Migration
  def change
    add_column :landing_cat_leads, :first_name, :string
    add_column :landing_cat_leads, :last_name, :string
  end
end
