# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root 'tests#index'
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: %i[index] do
      resources :answers, shallow: true, except: %i[index]
    end

    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :result
    end
  end
end
