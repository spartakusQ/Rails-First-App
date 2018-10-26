Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true
      resources :answers, shallow: true
  end
  
end
