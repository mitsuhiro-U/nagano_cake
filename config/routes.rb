Rails.application.routes.draw do
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
    get 'addresses/create'
    get 'addresses/update'
    get 'addresses/destroy'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/verification'
    get 'orders/thanks'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/withdrawal'
    get 'customers/withdrawal_update'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
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
  
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
