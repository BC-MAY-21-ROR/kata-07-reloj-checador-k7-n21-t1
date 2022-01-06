Rails.application.routes.draw do
    get 'index', to: 'index#index'
    get 'layouts/admin', to: 'layouts#admin'
    get 'layouts/branches', to: 'layouts#branches'
    get 'layouts/employees', to: 'layouts#employees'
end
