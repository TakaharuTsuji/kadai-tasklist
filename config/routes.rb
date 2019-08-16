Rails.application.routes.draw do
#  get 'sessions/new' # 19-8-16 deleted
#  get 'sessions/create'
#  get 'sessions/destroy'
#  get 'users/index'
#  get 'users/show'
#  get 'users/new'
#  get 'users/create'
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  resources :tasks

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
#  resources :users, only: [:index, :show, :new, :create] # 19-8-16 deleted new
  resources :users, only: [:index, :show, :create]
  
end
