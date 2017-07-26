Rails.application.routes.draw do
  get '/index' => 'pages#index'
  get '/classes' => 'pages#classes'
  get '/schedule' => 'pages#schedule'
  get '/results' => 'pages#results'
  get '/staff' => 'pages#staff'
  get '/about' => 'pages#about'
  get '/location' => 'pages#location'
  get '/login' => 'pages#login'

  root 'pages#index'
end
