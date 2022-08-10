Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  get 'users/new', to: 'users#new', as: :create_student
  post 'users', to: 'users#create'
  resources :books do
    resources :reservations, only: [ :new, :create, :update ]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
