Rails.application.routes.draw do

  root 'application#homepage'

  get '/libraries/most_popular' => 'libraries#most_popular', as: :most_popular_libraries

  resources :libraries do
    resources :reviews, only: [:create, :destroy, :index, :new]
  end

  resources :frameworks

  resources :languages

  devise_for :users, :controllers => {:omniauth_callbacks => 'callbacks'}

end
