Rails.application.routes.draw do

  root to: 'tests#index'

  resources :feedbacks, only: %i[new create]
  resources :badges, only: :index

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
      post :gist
    end
  end

  namespace :admin do
    resources :badges    
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
  end
end
