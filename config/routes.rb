Rails.application.routes.draw do
  resources :blogs do
    resources :comments
    member do
      post :thumbs_up
    end
  end
end

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

