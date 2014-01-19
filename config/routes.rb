LandingCat::Engine.routes.draw do
  root :to => 'admin#index'

  resources :experiments, :only => :show
  resources :leads, :only => :create
  resources :pages, :only => :show

  get :admin, :to => 'admin#index'

  namespace :admin do
    resources :campaigns, :only => :index
    resources :leads, :only => [ :index, :show, :destroy ]
    resources :pages, :except => [ :show ]

    mount SplitCat::Engine => '/split_cat'
  end

  get '/:name', :to => 'experiments#show', :as => :shortcut
end
