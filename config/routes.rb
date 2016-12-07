Rails.application.routes.draw do
  get 'waiter/orderStatus'
  post 'waiter/updateOrderStatus'
  post 'waiter/updateStatusOrders2'
  get 'waiter/takeOrder'
  get 'waiter/tables'
  post 'cook/postOrder'
  post 'waiter/postOrders'
  get 'cook/orders'
  get 'hosts/checkin'
  get 'hosts/checkout'
  post 'hosts/updateStatusTables'
  post 'hosts/TabelBill'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
#  get 'cook' => 'cooks#new'
  get 'manager' => 'managers#new'
#  get 'waiter' => 'waiters#new'
  get 'host' => 'hosts#new'
  get 'signup'  => 'employees#new'
  resources :employees

end
