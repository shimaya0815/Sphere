Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :users, only: [:index, :show]
  resources :todos
end
