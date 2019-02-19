Rails.application.routes.draw do
  root to: 'static_pages#about'
  get 'home', to: "static_pages#home"
  get 'about', to: "static_pages#about"
  get 'login', to: "session#new"
  post 'login', to: "sessions#create"
  get 'logout', to: "sessions#destroy"
  resources :posts, only: [:index, :show], shallow: true do
    resources :comments, module: :posts, only: [:create, :destroy, :update]
  end
  resources :users, shallow: true do
    resources :posts, module: :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
