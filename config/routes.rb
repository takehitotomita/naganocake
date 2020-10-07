Rails.application.routes.draw do  
   devise_for :customers, controllers: {
     sessions: 'devise/customers/sessions',
     passwords: 'devise/customers/passwords',
     registrations: 'devise/customers/registrations'
   }
   
   devise_for :admins, controllers: {
     sessions: 'devise/admins/sessions',
   }


  # get 'orders/new'
  # get 'orders/comfirm'
  # get 'orders/complete'
  # get 'orders/create'
  # get 'orders/index'
  # get 'orders/show'
   

  namespace :public do
    post  'orders/comfirm'
    get  'orders/complete'
    get 'customers/unsubscribe'
    resources :customers
    get 'top/about'
    resources :orders
    resources :items
    resources :cart_items
    delete 'cart_items/destroy_all'=> 'cart_items#destroy_all'
    resources :addresses
    post 'customers/withdraw'
  end
  
  root to: 'public/top#top'
  
  namespace :admin do
    resources :order_details, only: [:update]
    resources :genres
    resources :items
    resources :customers
    resources :orders
    get 'top/top'
  end
  
  
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
