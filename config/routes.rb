Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tests#index'
  
  resources :tests

  resources :tests do
    resources :question
  end
  
end
