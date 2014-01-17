LandingCat::Engine.routes.draw do
  root :to => 'admin#index'

  resources :leads, :only => :create
  resources :pages, :only => :show

  namespace :admin do
    get :index

    resources :campaigns, :only => :index
    resources :leads, :only => [ :index, :show, :destroy ]
    resources :pages
  end
end
