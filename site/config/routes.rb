Rails.application.routes.draw do

  get 'students/home'

  get 'administrators/home'

  get 'permited_teachers/index'

  get 'users/home' => 'users#home'
  get 'users/login' => 'users#login'
  post 'users/login' => 'users#check'
  get 'users/inscription' => 'users#inscription'
  post 'users/inscription' => 'permited_teachers#create'
  get 'users/logout'
  
  resources :permited_teachers
  
  get 'teachers/home' => 'teachers#home'
  get 'teachers/invite' => 'teachers#invite'
  post 'teachers/invite' => 'invited_students#create'
  resources :teachers

  resources :notes

  resources :subjects

  resources :tests
  

  root 'users#login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
