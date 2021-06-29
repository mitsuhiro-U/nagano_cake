Rails.application.routes.draw do
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
