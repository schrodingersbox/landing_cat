
def stub_view_routes

  view.stub( :admin_lead_path ).and_return( '/admin/lead' )
  view.stub( :admin_leads_path ).and_return( '/admin/leads' )

  view.stub( :admin_page_path ).and_return( '/landing_cat/admin/pages' )
  view.stub( :admin_pages_path ).and_return( '/landing_cat/admin/pages' )
  view.stub( :edit_admin_page_path ).and_return( '/landing_cat/admin/pages/edit' )
  view.stub( :new_admin_page_path ).and_return( '/landing_cat/admin/pages/new' )
end