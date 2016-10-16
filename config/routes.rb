Rails.application.routes.draw do
  get 'users/new'

  root 'static_pages#home'
  get '/my_colleges', to: 'static_pages#my_colleges'
  get '/most_reviews', to: 'static_pages#most_reviews'
  get '/find_colleges', to: 'static_pages#find_colleges'
  get '/college_rankings', to: 'static_pages#college_rankings'
  get '/login', to: 'static_pages#login'
  get '/signup', to: 'users#new'

  resources :users
end
