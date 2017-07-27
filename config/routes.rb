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

  # get 'admin/news' => 'admins#news'
  # get 'admin/classes' => 'admins#classes'
  # get '/admin/schedule' => 'admins#schedule'
  # get '/admin/results' => 'admins#results'
  # get '/admin/staff' => 'admins#staff'

  get 'admin/news' => 'news_updates#index'
  get 'admin/classes' => 'class_descriptions#index'
  get '/admin/schedule' => 'scheduled_classes#index'
  get '/admin/results' => 'results#index'
  get '/admin/staff' => 'staff_members#index'

  resources :class_descriptions, except: [:index, :new, :show, :edit]
  resources :news_updates, except: [:index, :new, :show, :edit]
  resources :results, except: [:index, :new, :show, :edit]
  resources :scheduled_classes, except: [:index, :new, :show, :edit]
  resources :staff_members, except: [:index, :new, :show, :edit]

  root 'pages#index'
end
