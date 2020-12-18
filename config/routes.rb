Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#new'
  resources :users, only: [:new, :create, :show, :destroy] do 
    resources :groups, only: [:new, :create]
    resources :tasks, only: [:new, :create, :show]
  end
  get '/login' => 'users#new'
  get '/app/' => 'users#show'
  delete '/logout' => 'users#destroy'
end
