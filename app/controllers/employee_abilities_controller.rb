class EmployeeAbilitiesController < ApplicationController
  def new
    @employee = Employee.find(params[:employee_id])
    @employee_ability = @employee.employee_abilities.build
  end

  def create
    @employee = Employee.find(params[:employee_id])
    @employee_ability = @employee.employee_abilities.build(employee_abilities_params)

    if @employee_ability.save
      redirect_to @employee, notice: 'Se agrego con exito'
    else
      render :new
    end
end

  protected

  def employee_abilities_params
    params.require(:employee_ability).permit!
  end
end
