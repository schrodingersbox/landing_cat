module LandingCat
  module GoogleAnalyticsHelper

    def google_analytics_tracking
      render :partial => 'landing_cat/google_analytics/tracking'
    end

    def google_analytics_split( experiment_key )
      render :partial => 'landing_cat/google_analytics/split',
             :locals => { :experiment_key => experiment_key }
    end

  end
end
