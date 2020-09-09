Rails.application.routes.draw do
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  resources :items
  resources :genres
  devise_for :sessions
  get 'top' => 'top#top'
  root to: 'top#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
