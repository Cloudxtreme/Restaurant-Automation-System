Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'cook' => 'cooks#new'
  get 'manager' => 'managers#new'
  get 'waiter' => 'waiters#new'
  get 'host' => 'hosts#new'
  get 'signup'  => 'employees#new'
  resources :employees

end
