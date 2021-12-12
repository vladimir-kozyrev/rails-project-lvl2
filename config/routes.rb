# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
    scope module: 'posts', shallow: true do
      resources :comments, only: %i[create new]
    end
  end

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
