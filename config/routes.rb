Rails.application.routes.draw do
  resources :sharings
  devise_for :users,
  :controllers => { omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations'}
    devise_scope :user do
      get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
      get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
      get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "sharings#index"
  match '/:id', :controller => 'profiles', :action => 'show', :as => 'profile', :via => :get
end
