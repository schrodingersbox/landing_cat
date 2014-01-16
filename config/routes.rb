LandingCat::Engine.routes.draw do
  root :to => 'landings#show'

  namespace :admin do
    resources :campaigns, :only => :index
  end
end
