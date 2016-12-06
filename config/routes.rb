Rails.application.routes.draw do
  get 'waiter/takeOrder'

  get 'waiter/tables'

  post 'cook/postOrder'  

  post 'waiter/postOrders'  

  get 'cook/orders'


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
