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

  def edit
    @employee = Employee.find(params[:employee_id])
    @dependant = @employee.dependants.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @employee = Employee.find(params[:employee_id])
    @dependant = @employee.dependants.find(params[:id])
    if @dependant.update(dependants_params)
      redirect_to @employee, notice: 'Se agrego con exito'
    else
      redirect_to @employee
    end
  end

  def destroy
    @employee = Employee.find(params[:employee_id])
    @dependant = @employee.dependants.find(params[:id])
    @dependant.destroy
    redirect_to @employee,  notice: "Se borro con exito"
  end

  protected

  def dependants_params
    params.require(:dependant).permit!
  end
end
