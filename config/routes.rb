Dine::Application.routes.draw do


  get "home/index"

  resources :pins
  resources :pin 

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, :registrations => "registrations" } do
  match 'users/:id' => 'users#show', as: :user

  root :to => 'pins#index'
  get 'about' => 'pages#about'
  get 'weekly' => 'pages#weekly'
  get 'shop' => 'pages#shop'
  get 'service' => 'pages#service'
	get 'privacy' => 'pages#privacy'
  get 'test' => 'pages#test'
  get 'recipies' => 'pages#recipies'  
  get 'know' => 'pages#know'
  get 'give' => 'pages#give' 
  get 'how' => 'pages#how' 
 

  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post

  match 'inform' => 'inform#new', :as => 'inform', :via => :get
  match 'inform' => 'inform#create', :as => 'inform', :via => :post

  as :user do
  match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  devise_for :users, :controllers => { :confirmations => "confirmations" }

end
