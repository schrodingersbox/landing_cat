class RemoveUtmgclidFromCampaigns < ActiveRecord::Migration

  class LandingCat::Campaign < ActiveRecord::Base; end
  class LandingCat::Lead < ActiveRecord::Base; end

  def change

    # Eliminate rows that will be dupes once utmgclid is gone

    LandingCat::Campaign.all.each do |campaign|
      attributes = campaign.attributes.select { |key, value| [ :utmcsr, :utmcmd, :utmctr, :utmcct, :utmccn ].include?( key.to_sym ) }
      matches = LandingCat::Campaign.where( attributes ).order( 'id desc' )
      first = matches.pop
      while dupe = matches.pop
        LandingCat::Lead.update_all "campaign_id = #{first.id}", :campaign_id => dupe.id
        dupe.destroy
      end
    end

    # Remove the column and rebuild the index

    remove_index :landing_cat_campaigns, :name => :index_landing_cat_campaigns_on_everything
    remove_column :landing_cat_campaigns, :utmgclid, :string
    add_index :landing_cat_campaigns, [ :utmcsr, :utmcmd, :utmctr, :utmcct, :utmccn ], :unique => true, :name => :index_landing_cat_campaigns_on_everything
  end
end
