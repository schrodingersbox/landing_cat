Rails.application.routes.draw do
  mount LandingCat::Engine => '/landing_cat'
  mount StatusCat::Engine => '/status_cat'
  root :to => 'root#index'
end
