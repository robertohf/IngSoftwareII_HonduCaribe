class WorkExpsController < ApplicationController
  def new
    @employee = Employee.find(params[:employee_id])
    @work_exp = @employee.work_exps.build
  end

  def create
    @employee = Employee.find(params[:employee_id])
    @work_exp = @employee.work_exps.build(work_exps_params)

    if @work_exp.save
      redirect_to @employee, notice: 'Se agrego con exito'
    else
      redirect_to @employee
    end
  end

  def edit
    @employee = Employee.find(params[:employee_id])
    @work_exp = @employee.work_exps.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @employee = Employee.find(params[:employee_id])
    @work_exp = @employee.work_exps.find(params[:id])
    if @work_exp.update(work_exps_params)
      redirect_to @employee, notice: 'Se agrego con exito'
    else
      redirect_to @employee
    end
  end

  def destroy
    @employee = Employee.find(params[:employee_id])
    @work_exp = @employee.work_exps.find(params[:id])
    @work_exp.destroy
    redirect_to @employee,  notice: "Se borro con exito"
  end

  protected

  def work_exps_params
    params.require(:work_exp).permit!
  end
end
