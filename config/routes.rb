Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get '/my_colleges', to: 'static_pages#my_colleges'
  get '/most_reviews', to: 'static_pages#most_reviews'
  get '/college_rankings', to: 'static_pages#college_rankings'
  get '/signup', to: 'users#new'
  get '/show_all_colleges', to: 'colleges#show_all_colleges'
  get '/login',   to: 'sessions#new'
  get '/submit_review', to: 'reviews#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :colleges
  resources :reviews

end
