Rails.application.routes.draw do

  root 'application#homepage'

  get '/libraries/most_popular' => 'libraries#most_popular', as: :most_popular_libraries
  get '/libraries/:id/next' => 'libraries#next', as: :library_next

  resources :libraries do
    resources :reviews, only: [:create, :destroy, :index, :new]
  end

  resources :frameworks do
    resources :libraries, only: :index
  end

  resources :languages

  devise_for :users, :controllers => {:omniauth_callbacks => 'callbacks', registrations: 'users/registrations'}

end
