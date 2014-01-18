require 'spec_helper'

describe LandingCat::GoogleAnalyticsHelper do

  describe '#google_analytics_tracking' do

    it 'renders the google tracking partial' do
      expect( helper ).to receive( :render ).with( :partial => 'landing_cat/google_analytics/tracking' )
      helper.google_analytics_tracking
    end

    it 'only renders once' do
      rendered = helper.google_analytics_tracking + helper.google_analytics_tracking
      expect( rendered.scan( /<script>/ ).count ).to eql( 1 )
    end

  end

  describe '#google_analytics_split' do

    it 'renders the split test partial' do
      experiment_key = '77931392-0'
      expected = {
          :partial => 'landing_cat/google_analytics/split',
          :locals => { :experiment_key => experiment_key }
      }
      expect( helper ).to receive( :render ).with( expected )
      helper.google_analytics_split( experiment_key )
    end

  end

end