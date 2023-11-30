Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :users do
        collection do
          post :sign_in, controller: :sessions, action: :create
        end
      end

      resources :projects do
        resources :project_members
      end

      resources :news

      resources :academic_bonds, except: [:show]
      resources :roles, except: [:show]
    end
  end
end
