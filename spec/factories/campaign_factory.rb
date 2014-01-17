FactoryGirl.define do

  factory :campaign, :class => LandingCat::Campaign do
    utmcsr  '*utmcsr*'
    utmcmd  '*utmcmd*'
    utmctr  '*utmctr*'
    utmcct  '*utmcct*'
    utmccn  '*utmccn*'
    utmgclid '*utmgclid*'
  end

end