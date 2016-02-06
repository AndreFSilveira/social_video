Rails.application.routes.draw do

  root 'static_pages#home'

  resources :tags
  resources :videos
  resources :news
  get 'users/new'

end
