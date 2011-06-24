Yousport::Application.routes.draw do

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :mobile_sessions, :only => [:new, :create]  
  resources :events, :only => [:create, :destroy]


  match '/signup',  :to => 'users#new'
  match '/yourevents', :to => 'pages#yourevents'
  match '/yoursubscriptions', :to => 'pages#yoursubscriptions'
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'


  root :to => 'pages#home'


end
