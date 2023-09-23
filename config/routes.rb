Rails.application.routes.draw do
  get 'find_recipes/show'
  # get 'add_recipe/input'
  # get 'add_recipe/view'
  devise_for :users
  # get 'static_pages/landing_page'
  # get 'static_pages/dashboard'
  # get 'static_pages/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'recipes#index'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :recipes do
    resources :comments
  end

  resources :profiles

  resources :find_recipes
end
