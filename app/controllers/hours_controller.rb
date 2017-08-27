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

  def edit
    @employee = Employee.find(params[:employee_id])
    @hour = @employee.hours.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @employee = Employee.find(params[:employee_id])
    @hour = @employee.hours.find(params[:id])
    if @hour.update(hours_params)
      redirect_to @employee, notice: 'Se agrego con exito'
    else
      redirect_to @employee
    end
  end

  def destroy
    @employee = Employee.find(params[:employee_id])
      @hour = @employee.hours.find(params[:id])
    @hour.destroy
    redirect_to hours_path, notice: 'Se borro con exito companero'
  end

  protected

  def hours_params
    params.require(:hour).permit!
  end
end
