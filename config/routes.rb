Rails.application.routes.draw do
  root to: 'employees#new'
  resources :employees, except: :destroy do
    collection do
      get :search
    end
  end

  resources :search_suggestions, only: :index
end
