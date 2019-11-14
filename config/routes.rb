Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails do
    resources :doses, only: %i[new index create]
  end
  resources :doses, only: %i[destroy]
end
