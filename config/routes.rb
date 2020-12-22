Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#new'
  resources :users, only: [:new, :create, :show, :destroy]
  resources :groups, only: [:index, :create, :show]
  resources :tasks, only: [:index, :create, :general, :toggle, :done]
  get '/login' => 'users#new'
  delete '/logout' => 'users#destroy'
  get '/app/' => 'groups#index'
  get '/tasks/general' => 'tasks#general'
  get '/tasks/done' => 'tasks#done'
  patch '/tasks/:id/toggle' => 'tasks#toggle'
end
