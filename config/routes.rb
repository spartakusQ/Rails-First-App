Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users, controllers: { sessions: 'users/sessions' },
             path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :passing_tests, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
  end
end
