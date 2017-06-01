class HoursController < ApplicationController
  def new
    @employee = Employee.find(params[:employee_id])
    @hour = @employee.hours.build
  end

  def create
    @employee = Employee.find(params[:employee_id])
    @hour = @employee.hours.build(hours_params)

    if @hour.save
      redirect_to @employee, notice: 'Se agrego con exito'
    else
      render :new
    end
end

  protected

  def hours_params
    params.require(:hour).permit!
  end
end
