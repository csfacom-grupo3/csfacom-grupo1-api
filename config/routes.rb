Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :project_members
      resources :projects
      resources :users, only: [] do
        collection do
          post :sign_in, controller: :sessions, action: :create
        end
      end
    end
  end
end
