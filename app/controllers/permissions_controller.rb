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

  protected

  def permissions_params
    params.require(:permission).permit!
  end
end
