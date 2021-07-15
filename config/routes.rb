Rails.application.routes.draw do
  
  
  scope module: :public do
    
    get '/' => "homes#top", as: 'top'
    get '/about' => "homes#about", as: 'about'
    
    resources :items, only: [:index, :show]
    
    delete 'customers/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    
    get '/orders/thanks' => 'orders#thanks', as: 'thanks'
    post '/orders/verification' => 'orders#verification', as: 'verification'
    resources :orders, only: [:new, :create, :index, :show]
    
    get '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    patch '/customers/withdrawal' => 'customers#withdrawal_update', as: 'withdrawal_update'
    resource :customers, only: [:show, :edit, :update]
    
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    
  end
  
  namespace :admin do
    get '/' => "homes#top", as: 'top'
    
    resources :customers, except: [:new, :create, :destroy]
    
    resources :genres, except: [:new, :show, :destroy]
    
    resources :items, except: [:destroy]
  end
 
  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }
  
  devise_for :customer, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
