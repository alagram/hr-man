Rails.application.routes.draw do
  root to: 'sessions#new'
  get 'search_suggestions', to: 'employees#search_suggestions'
  get 'employee_managers', to: 'employees#employee_managers'
  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'
  get 'welcome', to: 'homes#welcome'
  get 'employees/:id/team_leave_history', to: 'employees#team_leave_history', as: 'team_leave_history'
  get 'leave_history', to: 'leave_requests#leave_history'
  post 'book_leave', to: 'leave_requests#book_leave'
  resources :employees, except: :destroy do
    collection do
      get :search
    end

    member do
      get 'view_leave_details'
    end

    resources :next_of_kins, only: [:new, :create, :edit, :update]
    resources :emergencies, only: [:new, :create, :edit, :update]
  end
  resources :sessions, only: :create
  resources :leave_requests, only: [:new, :create] do
    collection do
      post 'get_end_date'
      post 'check_leave_bal'
      post 'confirm_leave_days'
    end
  end
end
