Rails.application.routes.draw do
  

  devise_for :organizations
  root "projects#index"
  devise_for :users
  
  resources :projects

end
