Rails.application.routes.draw do
  root to: 'index#index'
  get 'pages/admin', to: 'pages#admin'
  get 'pages/branches', to: 'pages#branches'
  get 'pages/employees', to: 'pages#employees'
end
