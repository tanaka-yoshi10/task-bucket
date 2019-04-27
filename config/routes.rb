Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks do
    member do
      put :start
      put :complete
      put :clone
    end
  end
  resources :projects
end
