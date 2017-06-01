class EmployeesController < ApplicationController
  def hours_show
    respond_to do |format|
      format.html
      format.js { render 'hours_show', locals: { employee: Employee.find(params[:employee_id]), from: params[:report][:from], to: params[:report][:to] } }
    end
  end

  def hours
    @employees = Employee.where(employee_status: true)

    respond_to do |format|
      format.html
      format.js { render 'hours', locals: { employees: Employee.where(employee_status: true), time_in: params[:report][:from], time_out: params[:report][:to] } }
    end
  end

  def index
    @employees = Employee.where('employee_status = true')
    @inactiveemployees = Employee.where('employee_status = false')
    query = params[:q]
    @employees = @employees.where("name LIKE '%#{query}%'") if query

    if request.xhr?
      render partial: 'table', locals: { employees: @employees }, status: 200
    end
  end

  def show
    @employee = Employee.find(params[:id])
    @education = @employee.educations.build
    @work_exp = @employee.work_exps.build
    @ability =  @employee.abilities.build
    @dependant = @employee.dependants.build
    @permission = @employee.permissions.build
    @work_structures = WorkStructure.all
    @employee_ability = @employee.employee_abilities.build
    @hour = @employee.hours.build
    @work_structure_of_employee = WorkStructure.find_by_id(@employee.work_structure_id)
  end

  def new
    @employee = Employee.new
    @employee.avatar = params[:file]
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.RAP_code = @employee.identity_number

    if @employee.save
      redirect_to employees_path
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.RAP_code = @employee.identity_number

    if @employee.update_attributes(employee_params)
      redirect_to employees_path
    else
      render :edit
    end
  end

  def comparacion
    @employee = Employee.find(params[:id])
  end

  def test; end

  def suprimir
    @employee = Employee.find(params[:id])
  end

  def bonoEducativo
    Employee.TieneHijosMenores
    @employees = Employee.where(hasChildren: true)
  end

  def reactivar
    @employee = Employee.find(params[:id])
    if @employee.update_column(:employee_status, true)
      redirect_to employees_path
    else
      redirect_to employee_path(@employee)
    end
  end

  protected

  def employee_params
    params.require(:employee).permit!
  end
end
