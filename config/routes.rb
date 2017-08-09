Rails.application.routes.draw do
  devise_for :admins
  get '/index' => 'pages#index'
  get '/classes' => 'pages#classes'
  get '/schedule' => 'pages#schedule'
  get '/results' => 'pages#results'
  get '/staff' => 'pages#staff'
  get '/about' => 'pages#about'
  get '/location' => 'pages#location'
  get '/login' => 'pages#login'
  get '/sign_up' => 'pages#sign_up'

  get 'admin/news' => 'news_updates#index'
  get 'admin/classes' => 'class_descriptions#index'
  get '/admin/schedule' => 'scheduled_classes#index'
  get '/admin/results' => 'results#index'
  get '/admin/staff' => 'staff_members#index'

  resources :class_descriptions, except: [:index, :show]
  resources :news_updates, except: [:index, :show]
  resources :results, except: [:index, :show]
  resources :scheduled_classes, except: [:index, :show]
  resources :staff_members, except: [:index, :show]

  root 'pages#index'
end
