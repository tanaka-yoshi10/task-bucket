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
      put :postpone
      put :resume
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
  resources :monthly_reports, only: %i(index)
  resources :future_tasks, only: %i(index new create)
  resource :dashboard
  namespace :pi_api, defaults: { format: :json } do # FIXME: 名前再考
    resource :current, only: %i(show)
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :tasks, only: %i() do
        member do
          put :start
          put :complete
          put :clone
          put :pause
          put :postpone
        end
      end
    end
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

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
