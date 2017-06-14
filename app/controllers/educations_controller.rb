class EducationsController < ApplicationController
  
  def new
    @employee = Employee.find(params[:employee_id])
    @education = @employee.educations.build
  end

  def create
    @employee = Employee.find(params[:employee_id])
    @education = @employee.educations.build(educations_params)

    if @education.save
      redirect_to @employee, notice: 'Se agrego con exito'
    else
      redirect_to @employee
    end
  end

  def edit
    @employee = Employee.find(params[:employee_id])
    @education = @employee.educations.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @employee = Employee.find(params[:employee_id])
    @education = @employee.educations.find(params[:id])
    if @education.update(educations_params)
      redirect_to @employee, notice: 'Se agrego con exito'
    else
      redirect_to @employee
    end
  end

  def destroy
    @employee = Employee.find(params[:employee_id])
    @education = @employee.educations.find(params[:id])
    @education.destroy
    redirect_to @employee,  notice: "Se borro con exito"
  end

  protected

  def educations_params
    params.require(:education).permit!
  end
end
