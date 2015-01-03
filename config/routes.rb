Rails.application.routes.draw do
  root to: 'sessions#new'
  get 'search_suggestions', to: 'employees#search_suggestions'
  get 'employee_managers', to: 'employees#employee_managers'
  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'
  get 'welcome', to: 'homes#welcome'
  get 'team_leave_history', to: 'leave_requests#team_leave_history'
  get 'leave_history', to: 'leave_requests#leave_history'
  post 'book_leave', to: 'leave_requests#book_leave'
  get 'pending_requests', to: 'leave_requests#pending_requests'
  post 'approve_leave', to: 'leave_requests#approve_leave'
  delete 'reject_leave', to: 'leave_requests#reject_leave'

  resources :employees, except: :destroy do
    collection do
      get :search
    end

    resources :next_of_kins, only: [:new, :create, :edit, :update]
    resources :emergencies, only: [:new, :create, :edit, :update]
  end

  resources :sessions, only: :create
  resources :leave_requests, only: [:new, :create, :show] do
    collection do
      post 'get_end_date'
      post 'check_leave_bal'
      post 'confirm_leave_days'
    end
  end
end
