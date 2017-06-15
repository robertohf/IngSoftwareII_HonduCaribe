class PermissionsController < ApplicationController
  def new
    @employee = Employee.find(params[:employee_id])
    @permission = @employee.permissions.build
  end

  def create
    @employee = Employee.find(params[:employee_id])
    @permission = @employee.permissions.build(permissions_params)
    @employee.increment!(:monthly_permissions)
    @employee.increment!(:annual_permissions)
    if @permission.save
      redirect_to @employee, notice: 'Se agrego con exito'
    else
      render :new
    end
  end


  def edit
    @employee = Employee.find(params[:employee_id])
    @permission = @employee.permissions.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @employee = Employee.find(params[:employee_id])
    @permission = @employee.permissions.find(params[:id])
    if @permission.update(permissions_params)
      redirect_to @employee, notice: 'Se agrego con exito'
    else
      redirect_to @employee
    end
  end

  def destroy
    @employee = Employee.find(params[:employee_id])
    @permission = @employee.permissions.find(params[:id])
    @permission.destroy
    redirect_to @employee,  notice: "Se borro con exito"
  end

  protected

  def permissions_params
    params.require(:permission).permit!
  end
end
