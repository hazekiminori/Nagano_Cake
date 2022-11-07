Rails.application.routes.draw do
  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  root to: "public/homes#top"
  get '/about' => 'public/homes#about', as: 'about'
  get '/admin' => 'admin/homes#top'

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  namespace :admin do
    resources :order_details, only: [:update]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    resources :orders, only: [:show, :update]
  end

  scope module: :public do
  resources :items, only: [:index, :show]
  resources :customers, only: [:edit, :update, :quit, :withdrawal]
  get '/customers/my_page' => 'public/customers#show', as:'my_page'

  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]

  resources :orders, only: [:new, :confirm, :thanks, :create, :index, :show]

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
