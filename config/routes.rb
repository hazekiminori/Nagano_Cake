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
    resource :items, only: [:new, :create]
    get '/items' => 'items#index'
    resources :items, only: [:show, :edit, :update]
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
  get '/items' => 'items#index', as:'items'
  get '/items/:id' => 'items#show', as:'items_show'
  get '/customers/my_page' => 'customers#show', as:'my_page'
  get '/customers/infomation/edit' => 'customers#edit', as:'infomation'
  patch '/customers/infomation' => 'customers#update'
  get '/customers/quit' => 'customers#quit', as:'quit'
  patch '/customers/withdrawal' => 'customers#withdrawal', as:'withdrawal'
  delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items
  
  resources :orders, only: [:new, :show, :index, :create]
  post '/orders/confirm' => 'orders#confirm', as:'confirm'
  get '/orders/thanks' => 'orders#thanks', as:'thanks'

  post '/addresses' => 'addresses#create'
  get '/addresses' => 'addresses#index'
  get '/addresses/:id/edit' => 'addresses#edit'
  patch '/addresses/:id' => 'addresses#update'
  delete '/addresses/:id' => 'addresses#destroy'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
