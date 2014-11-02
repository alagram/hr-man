Rails.application.routes.draw do
  root to: 'employees#new'
  get 'search_suggestions', to: 'employees#search_suggestions'
  resources :employees, except: :destroy do
    collection do
      get :search
    end
  end
end
