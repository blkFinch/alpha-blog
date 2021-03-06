Rails.application.routes.draw do
  resources :articles
  resources :users, except: [:new]
  resources :categories, except: [:delete]

  get  'about' , to:'pages#about'
  get  'signup', to:'users#new'
  get  'login' , to:'sessions#new'
  post 'login' , to:'sessions#create'
  get  'logout' , to:'sessions#destroy'


  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
