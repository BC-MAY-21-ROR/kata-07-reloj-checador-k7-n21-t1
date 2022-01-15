class PagesController < ApplicationController
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
    before_action :authenticate_user!
>>>>>>> c4cabd3 (backup with devise)
=======
    before_action :authenticate_user!
>>>>>>> 132b374931ce7a2b848d49187dfa9c4bdefc3bda
    def employees
        @employees_list = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to pages_employees_path
        else
            render :new
        end
    end

    #dev in progres//////////////////////////
    def edit
        @employee = Employee.find(params[:id])
    end

   def update
        @employee = Employee.find(params[:id])
        if @employee.update(employee_params)
            redirect_to pages_employees_path
        else
            render :edit
        end
    end

    def disable
        @employee = Employee.find(params[:id])
        @employee.active == true ? @employee.active = false : @employee.active = true
        @employee.save
        redirect_to pages_employees_path
    end

    private
        def employee_params
            params.require(:employee).permit(:name, :position, :email, :active, :branch_id, :created_at, :updated_at)
        end
<<<<<<< HEAD
>>>>>>> 32d35a8 (the coppy more recient)
=======
>>>>>>> 132b374931ce7a2b848d49187dfa9c4bdefc3bda
end
