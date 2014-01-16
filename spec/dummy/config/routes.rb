Rails.application.routes.draw do
  mount LandingCat::Engine => '/landing_cat'
  root :to => 'root#index'
end
