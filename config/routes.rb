Rails.application.routes.draw do

   scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'static_pages#home'

    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create', as: 'login_path'
    delete 'logout'  => 'sessions#destroy'

    resources :tags,:except => :show
    resources :videos do
      resource :comments
    end
    resources :news do
     collection do
      get :search
     end
      resource :comments
    end
    resources :users
    resources :password_resets,     only: [:new, :create, :edit, :update]

    get 'make_admin/:id' => 'users#make_admin', as: 'user_make_admin'
    get 'revoke_admin/:id' => 'users#revoke_admin', as: 'user_revoke_admin'

    get 'friendship' => 'users#friendship', as: 'user_friendship'
    get 'add_friend/:id' => 'users#add_friend', as: 'user_add_friend'
    get 'confirm_friendship/:id' => 'users#confirm_friendship', as: 'user_confirm_friendship'

    get 'comments/aprove/:id' => 'comments#aprove', as: 'comment_aprove'
    delete 'comments/destroy/:id' => 'comments#destroy', as: 'comment_destroy'

    post '/rate' => 'rater#create', :as => 'rate'
   end
end
