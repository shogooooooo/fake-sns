# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'posts#index'
  resource :profile, only: %i[show update]
  
  resources :posts, only: %i[index new create] do
    resource :like, only: %i[show create destroy]
  end
end
