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

  protected

  def work_exps_params
    params.require(:work_exp).permit!
  end
end
