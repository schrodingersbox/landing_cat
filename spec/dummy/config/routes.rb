Rails.application.routes.draw do
  mount LandingCat::Engine => '/landing_cat'
  mount StatusCat::Engine => '/status_cat'

  root :to => 'root#index'

  get '/login', :to => 'root#login'
  get '/logout', :to => 'root#logout'

  get '/admin', :to => 'landing_cat/admin#index'
end
