LandingCat::Engine.routes.draw do
  root :to => 'landings#show'

  namespace :admin do
    resources :campaigns, :only => :index
    resources :leads, :only => [ :index, :show, :destroy ]
    resources :pages
  end
end
