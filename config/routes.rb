LandingCat::Engine.routes.draw do
  root :to => 'admin#index'

  resources :leads, :only => :create
  resources :pages, :only => :show

  get :admin, :to => 'admin#index'

  namespace :admin do
    resources :campaigns, :only => :index
    resources :leads, :only => [ :index, :show, :destroy ]
    resources :pages
  end

  get '/:name', :to => 'pages#show', :as => :shortcut
end
