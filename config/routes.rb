Rails.application.routes.draw do
  get 'colleges/new'

  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get '/my_colleges', to: 'static_pages#my_colleges'
  get '/most_reviews', to: 'static_pages#most_reviews'
  get '/find_colleges', to: 'static_pages#find_colleges'
  get '/college_rankings', to: 'static_pages#college_rankings'
  get '/signup', to: 'users#new'
  get '/colleges', to: 'colleges#new'
  get '/import_colleges', to: 'colleges#import_colleges'
  get '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  post '/import_colleges', to: 'colleges#import_colleges'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :colleges

end
