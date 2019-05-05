Rails.application.routes.draw do
  resources :routines
  devise_for :users
  root to: 'tasks#index'
  resources :tasks do
    member do
      put :start
      put :complete
      put :clone
    end
  end
  resources :projects
  resources :daily_reports, only: %i(index)
end
