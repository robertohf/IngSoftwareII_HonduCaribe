class DependantsController < ApplicationController
  def new
    @employee = Employee.find(params[:employee_id])
    @dependant = @employee.dependants.build
  end

  def create
    @employee = Employee.find(params[:employee_id])
    @dependant = @employee.dependants.build(dependants_params)

    if @dependant.save
      redirect_to @employee, notice: 'Se agrego con exito'
    else
      render :new
    end
end

  protected

  def dependants_params
    params.require(:dependant).permit!
  end
end
