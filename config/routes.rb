Rails.application.routes.draw do
  devise_for :users
  get 'index', to: 'index#index'
  get 'pages/admin', to: 'pages#admin'
  get 'pages/branches', to: 'pages#branches'
  get 'pages/employees', to: 'pages#employees'
  get 'pages/reports', to: 'pages#reports'

  # para crear un nuevo employee
  get 'pages/employees/new', to: 'pages#new'
  post 'employees', to: 'pages#create'
  # para editar employee
  get 'pages/employees/:id/edit', to: 'pages#edit', as: 'edit_employee'
  patch 'employees/:id', to: 'pages#update'
  put 'employees/:id', to: 'pages#update'
  # para descativar un employee
  get 'employees/:id', to: 'pages#disable'
  resources :employees

  # para crear un nuevo branch
  get 'pages/branches/new', to: 'pages#new_branch'
  post 'branches', to: 'pages#create_branch'
  # para editar branch
  get 'pages/branches/:id/edit', to: 'pages#edit_branch', as: 'edit_branch'
  patch 'branches/:id', to: 'pages#update_branch'
  put 'branches/:id', to: 'pages#update_branch'
  # para descativar un branch
  get 'branches/:id', to: 'pages#disable_branch'
  resources :branches

  # para filtrar reports
  post 'pages/reports', to: 'pages#reports'

  # para hacer checkin/checkout
  post 'index', to: 'index#index'

  root to: 'index#index'
end
