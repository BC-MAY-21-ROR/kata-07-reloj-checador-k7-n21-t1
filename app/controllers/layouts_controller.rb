class LayoutsController < ApplicationController
  def employees
    @empleado = Employee.all
  end
end
