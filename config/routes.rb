Rails.application.routes.draw do
  root to: 'sessions#new'
  get 'search_suggestions', to: 'employees#search_suggestions'
  get 'employee_managers', to: 'employees#employee_managers'
  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'
  get 'welcome', to: 'homes#welcome'
  resources :employees, except: :destroy do
    collection do
      get :search
    end
    resources :next_of_kins, only: [:new, :create, :edit, :update]
    resources :emergencies, only: [:new, :create, :edit, :update]
  end
  resources :sessions, only: :create
  resources :leave_requests, only: [:new, :create]
end
