# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
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
