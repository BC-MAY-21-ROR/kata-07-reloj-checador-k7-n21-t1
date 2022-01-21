class PagesController < ApplicationController
  before_action :authenticate_user!
  def employees
    @employees_list= Employee.all
  end

  def branches
    @branches_list = Branch.all
  end

  # CRUD-EMPLOYEE
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
    @employee.active = (!(@employee.active == true))
    @employee.save
    redirect_to pages_employees_path
  end

  # CRUD-BRANCH
  def new_branch
    @branch = Branch.new
  end

  def create_branch
    @branch = Branch.new(branch_params)
    if @branch.save
      redirect_to pages_branches_path
    else
      render :new
    end
  end

  def edit_branch
    @branch = Branch.find(params[:id])
  end

  def update_branch
    @branch = Branch.find(params[:id])
    if @branch.update(branch_params)
      redirect_to pages_branches_path
    else
      render :edit
    end
  end

  def disable_branch
    @branch = Branch.find(params[:id])
    @branch.active = (!(@branch.active == true))
    @branch.save
    redirect_to pages_branches_path
  end

  # Horas de checks in/out promedio, asistencias por dia y faltas por mes
  def reports
    @prueba_reports = 'hola sencillo'

    vec_checks = Check.all

    cont = 0
    prom_loc_entrance = 0
    prom_loc_out = 0

    vec_checks.length.times do |i|
      prom_loc_entrance += vec_checks[i].entrance.time.hour
      prom_loc_out += vec_checks[i].out.time.hour
      cont += 1
    end

    if vec_checks != 0
      prom_loc_entrance /= cont
      prom_loc_out /= cont
    end

    @prom_entrance = (prom_loc_entrance) <= 12 ? "#{prom_loc_entrance}:00 am" : "#{prom_loc_entrance}:00 pm"
    @prom_out = (prom_loc_out) <= 12 ? "#{prom_loc_out}:00 am" : "#{prom_loc_out}:00 pm"

    fecha = if !params[:dia].nil?
              Date.parse(params[:dia])
            else
              "#{Time.now.strftime('%Y')}-#{Time.now.strftime('%m')}-#{Time.now.strftime('%e')}"
            end
    @asists_day = Check.all.where('entrance like ?', "#{fecha}%").count

    #filtrado de ausencias en el mes

    mes = if !params[:mes].nil?
      params[:mes]
    else
      Time.now.strftime('%m')
    end
    
    cantidad_empleados = Employee.all.count #cantidad_empleados = 50 empleados
    dias_actuales = Time.now.strftime('%e').to_i #dias_actuales= 7 dias del mes actual

    if dias_actuales < 14 #primer semana del mes
        dias_actuales -= 1
    elsif dias_actuales > 14 && dias_actuales < 21 #segunda semana del mes
        dias_actuales -= 2
    elsif dias_actuales > 21 && dias_actuales < 28 #tercer semana del mes
        dias_actuales -= 3
    elsif dias_actuales >= 28 #cuarta semana del mes
        dias_actuales -=4
    end

    asistencias_de_ley = (cantidad_empleados*(dias_actuales)) #asistencias que deberia haber 
    total_checks = (Check.all.where('entrance like ?', "%#{mes}%").count)/2 #total de asistencias q hay en checks
    
    @absences_month = asistencias_de_ley - total_checks
  end

  # CUIDADO CON LA SINTAXIS DE ESTO
  private

  def branch_params
    params.require(:branch).permit(:name, :direction, :created_at, :updated_at)
  end

  def employee_params
    params.require(:employee).permit(:name, :position, :email, :active, :branch_id, :created_at, :updated_at)
  end
end
