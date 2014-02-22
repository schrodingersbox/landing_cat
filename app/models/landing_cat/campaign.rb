module LandingCat
  class Campaign < ActiveRecord::Base

    has_many :leads

    UTMZ = '__utmz'.freeze

    def parse_cookies( cookies )
      return self unless cookies
      return self unless cookie = cookies[ UTMZ ]

      # See http://www.morevisibility.com/analyticsblog/from-__utma-to-__utmz-google-analytics-cookies.html

      cookie.split( '|' ).each do |line|
        /(utm[a-z]+?)=(.*)/.match( line )
        if $1 && $2
          if attributes.keys.include?( $1 )
            self[ $1 ] = $2
          end
        end
      end

      return self
    end

    def self.find_or_create_by_cookies( cookies )
      campaign = Campaign.new.parse_cookies( cookies )
      match = campaign.attributes.select { |key, value| [ :utmcsr, :utmcmd, :utmctr, :utmcct, :utmccn ].include?( key.to_sym ) }

      unless found = Campaign.where( match ).first
        campaign.save
        found = campaign
      end

      return found
    end

  end
end