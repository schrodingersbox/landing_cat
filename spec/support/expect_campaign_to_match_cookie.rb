# Coupled to spec/fixtures/cookie.txt

def expect_campaign_to_match_cookie( campaign )
  expect( campaign.utmcsr ).to eql( 'google' )
  expect( campaign.utmcmd ).to eql( 'cpc' )
  expect( campaign.utmctr ).to eql( 'exact_web development' )
  expect( campaign.utmcct ).to eql( '11189174903::adpos_1t2::network_g' )
  expect( campaign.utmccn ).to eql( 'Mobile> PHP Programming' )
end

