Rails.application.routes.draw do

  root 'static_pages#home'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create', as: 'login_path'
  delete 'logout'  => 'sessions#destroy'

  resources :tags
  resources :videos
  resources :news
  resources :users

end
