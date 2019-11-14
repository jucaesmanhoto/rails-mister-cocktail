Rails.application.routes.draw do
  resources :cocktails do
    resources :doses, only: %i[new index create]
  end
  resources :doses, only: %i[destroy]
end
