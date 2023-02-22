Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants, only: ['index', 'show', 'new', 'create'] do
    resources :reviews, only: ['new', 'create']
  end
  # index - view all
  # get "restaurants", to: "restaurants#index"
  # # create
  # get "restaurants/new", to: "restaurants#new", as: :new_restaurant
  # post "restaurants", to: "restaurants#create"
  # #read one - show
  # get "restaurants/:id", to: "restaurants#show", as: :restaurant
  # # get
end
