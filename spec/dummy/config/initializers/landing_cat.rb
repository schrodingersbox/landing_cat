LandingCat.configure do |config|
  config.admin_before_filter = :authenticate!
  config.admin_layout = 'admin'
  config.public_layout = 'application'
  config.lead_after_create = ->(lead) { Rails.logger.info "LEAD CREATED: #{lead.email}" }
end
