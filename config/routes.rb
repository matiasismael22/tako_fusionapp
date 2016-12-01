Rails.application.routes.draw do


  #USUARIOS

  get 'users/index'
  get 'users/new'
  get 'users/edit' => 'users#edit', :as => 'edit'
  get 'users/show/:id' => 'users#show', :as => 'user_show'
  post 'users/create_user'
  post '/users/:id/edit'  => 'user#edit', :as => 'user_edit'
  post 'users/destroy/:id' => 'users#destroy', :as => 'user_destroy'
  #FIN USUARIOS

  devise_for :models
  resources :dte_directions
  resources :directions
  devise_for :users, :controllers => {:omniauth_callbacks => "callbacks"}
  get '/cart' => 'cart#index'
  get '/cart/clear' => 'cart#clearCart'
  #get '/cart/:id' => 'cart#add'

  resources :products
  root 'page#home'
  get 'page/about'
  get 'page/contact'
  
  post 'cart/add'
  post 'cart/delete'

  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end