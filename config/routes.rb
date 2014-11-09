Rails.application.routes.draw do
  root to: 'employees#new'
  get 'search_suggestions', to: 'employees#search_suggestions'
  get 'employee_managers', to: 'employees#employee_managers'
  resources :employees, except: :destroy do
    collection do
      get :search
    end
    resources :next_of_kins, only: [:new, :create, :edit, :update]
  end
end
