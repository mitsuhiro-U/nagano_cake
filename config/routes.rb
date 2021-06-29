Rails.application.routes.draw do
  namespace :admin do
    resources :customers, except: [:new, :create, :destroy]
  end
  namespace :admin do
    resources :genres, except: [:new, :show, :destroy]
  end
  namespace :admin do
    resources :items, except: [:destroy]
  end
  namespace :admin do
    get '/' => "homes#top", as: 'top'
  end
  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }
  
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
