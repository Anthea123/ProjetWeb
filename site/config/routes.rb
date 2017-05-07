Rails.application.routes.draw do
  get 'permited_teachers/create'

  get 'teachers/create'

  get 'users/home' => 'users#home'
  get 'users/login' => 'users#login'
  post 'users/login' => 'users#check'
  get 'users/inscription' => 'users#inscription'
  post 'users/inscription' => 'permited_teachers#create'
  
  resources :permited_teachers

  resources :teachers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
