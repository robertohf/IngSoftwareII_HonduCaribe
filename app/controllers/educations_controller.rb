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

  protected

  def educations_params
    params.require(:education).permit!
  end
end
