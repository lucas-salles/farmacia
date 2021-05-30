Rails.application.routes.draw do
  resources :sales, only: [:index, :show, :new, :edit, :create, :update]
  resources :categories
  resources :medicaments, only: [:index, :show, :new, :edit, :create, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :home
  root 'home#index'

  resources :sessions, only: [:create, :new, :destroy]
  get '/signup', to: 'users#index'
  delete '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'

  namespace :api do
    resources :medicaments, only: [:index, :show, :create, :update]
  end

  namespace :api do
    resources :categories
  end

  # constraints subdomain: 'api' do
  #   scope module: 'api' do
  #     resources :medicaments
  #   end
  # end
end
