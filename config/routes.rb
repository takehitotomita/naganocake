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
    resources :customers
    get 'top/top'
    get 'top/about'
    resources :orders
    resources :items
    resources :cart_items
    delete 'cart_items/destroy'
    resources :addresses
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  end
  
  root to: 'admin/top#top'
  
  namespace :admin do
    patch 'order_details/update'
    resources :genres
    resources :items
    resources :customers
    resources :orders
  end
  
  
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
