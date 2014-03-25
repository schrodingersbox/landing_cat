LandingCat.configure do |config|

  config.authorize_with do
    authenticate! unless Rails.env.test?
  end

  config.admin_layout = 'admin'
  config.public_layout = 'application'

  config.lead_after_create = ->(lead) { Rails.logger.info "LEAD CREATED: #{lead.email}" }

end
