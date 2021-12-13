# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  resources :posts, only: %i[index show new create] do
    scope module: 'posts' do
      resources :comments, only: %i[create new]
      resources :likes, only: %i[create destroy]
    end
  end

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
