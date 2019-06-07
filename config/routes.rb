Rails.application.routes.draw do
  use_doorkeeper
  resources :shortcuts do
    member do
      put :start
    end
  end
  resources :routines
  devise_for :users
  root to: 'tasks#index'
  resources :tasks do
    member do
      put :start
      put :complete
      put :clone
      put :pause
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
  namespace :api do
    resources :tasks, only: %i(index) do
      member do
        put :complete
        put :comment
      end
      collection do
        get :doing
      end
    end
    resources :shortcuts, only: %i(index) do
      member do
        put :start
      end
    end

  end
end
