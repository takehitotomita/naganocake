Rails.application.routes.draw do
  root to: 'admin/top#top'
  namespace :admin do
    resources :genres

    
    resources :items
  end
  
  
  devise_for :sessions
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
