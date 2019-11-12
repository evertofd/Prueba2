Rails.application.routes.draw do

  get 'completeds/create'
  get '/details/detail', to: 'details#detail'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :tasks, only: [:index, :detail] do
    resources :completeds, only: :create
  end

  root to: 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
