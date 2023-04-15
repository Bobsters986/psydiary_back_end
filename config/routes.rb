Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do

      post "/login", to: "users#login_user"
      
      resources :users, only: [:show, :create, :update] do
        resources :microdose_log_entries, only: %i[show index], controller: "users/microdose_log_entries"
        resources :daily_log_entries, only: %i[show], controller: "users/daily_log_entries"
        resources :log_entries, only: [:index], controller: "users/log_entries"
      end
      
      resources :protocols, only: %i[index show create]

    end
  end
end
