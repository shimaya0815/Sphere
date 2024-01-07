Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'

  # Deviseのルーティングを事業所IDスコープの外に設定
  devise_for :users, controllers: {
    invitations: 'users/invitations',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # 事業所IDを含むURLスコープの設定
  scope '/:office_id' do
    resources :users, only: [:index, :show]
    resources :todos
    resources :tax_clients, only: [:index, :show, :new, :create]
  end
end
