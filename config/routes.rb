Rails.application.routes.draw do

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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end