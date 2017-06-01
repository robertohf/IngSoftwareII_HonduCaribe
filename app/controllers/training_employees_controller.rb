class TrainingEmployeesController < ApplicationController
  def new
    @training_employee = TrainingEmployee.new
  end

  def create
    @training = Training.find(params[:training_id])
    @training_employee = @training.training_employees.build(training_employees_params)

    if @training_employee.save
      redirect_to @training, notice: 'Se agrego con exito'
    else
      render :new
    end
end

  def update
    @training = Training.find(params[:training_id])
    @training_employee = TrainingEmployee.find(params[:id])
    if @training_employee.update_attributes(training_employees_params)
      redirect_to @training
    else
      render :edit
    end
  end

  protected

  def training_employees_params
    params.require(:training_employee).permit!
  end
end
