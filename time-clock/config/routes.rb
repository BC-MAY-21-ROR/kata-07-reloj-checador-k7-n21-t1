Rails.application.routes.draw do
    get 'index', to: 'index#index'
<<<<<<< Updated upstream
    get 'layouts/admin', to: 'layouts#admin'
    get 'layouts/branches', to: 'layouts#branches'
    get 'layouts/employees', to: 'layouts#employees'
=======
    get 'pages/admin', to: 'pages#admin'
    get 'pages/branches', to: 'pages#branches'
    get 'pages/employees', to: 'pages#employees'
    #para crear un nuevo employee
    get 'pages/employees/new', to: 'pages#new'
    post 'employees', to: 'pages#create'

    #para editar employee
    get 'pages/employees/:id/edit', to: 'pages#edit', as: 'edit_employee'
    patch 'employees/:id', to: 'pages#update'
    put 'employees/:id', to: 'pages#update'
    #para descativar un employee
    get 'employees/:id', to: 'pages#disable'
    resources :employees

>>>>>>> Stashed changes
end
