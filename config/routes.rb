Rails.application.routes.draw do
  resources :articles
  get  'about' , to:'pages#about'
  get  'signup', to:'users#new'
  get  'login' , to:'sessions#new'
  post 'login' , to:'sessions#create'
  get  'logout' , to:'sessions#destroy'

  resources :users, except: [:new]

  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
