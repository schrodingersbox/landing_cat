
def stub_view_routes

  view.stub( :admin_campaigns_path ).and_return( '/admin/campaigns' )

  view.stub( :admin_lead_path ).and_return( '/landing_cat/admin/lead' )
  view.stub( :admin_leads_path ).and_return( '/landing_cat/admin/leads' )

  view.stub( :admin_page_path ).and_return( '/landing_cat/admin/pages' )
  view.stub( :admin_pages_path ).and_return( '/landing_cat/admin/pages' )
  view.stub( :edit_admin_page_path ).and_return( '/landing_cat/admin/pages/edit' )
  view.stub( :new_admin_page_path ).and_return( '/landing_cat/admin/pages/new' )


  view.stub( :edit_page_path ).and_return( '/landing_cat/pages/edit' )
  view.stub( :pages_path ).and_return( '/landing_cat/pages' )

end