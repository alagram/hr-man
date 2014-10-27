Rails.application.routes.draw do
  root to: 'employees#new'
  resources :employees, except: :destroy
end
