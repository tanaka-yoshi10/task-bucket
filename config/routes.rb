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
    collection do
      get :not_completed
    end
  end
  resources :projects do
    resources :tasks, only: %i(index), module: :projects
  end
  resources :daily_reports, only: %i(index)
  resources :weekly_reports, only: %i(index)
  resource :dashboard
end
