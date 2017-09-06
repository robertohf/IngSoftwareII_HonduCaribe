class IncapacitiesController < ApplicationController
	def new
		@employee = Employee.find(params[:employee_id])
		@incapacity = @employee.incapacities.build
	end

	def create
		@employee = Employee.find(params[:employee_id])
		@incapacity = @employee.incapacities.build(incapacities_params)

		if @incapacity.save
			redirect_to @employee, notice: 'Se agrego correctamente'
		else
			render :new
		end
	end

	def edit
		@employee = Employee.find(params[:employee_id])
		@incapacity = employee.incapacities.find(params[:id])
		respond_to do |format|
			format.html
			format.js
		end
	end

	def update
		@employee = Employee.find(params[:employee_id])
		@incapacity = employee.incapacities.find(params[:id])
		if @incapacity.update(incapacities_params)
      		redirect_to @employee, notice: 'Se agrego con exito'
    	else
      		redirect_to @employee
    	end
	end

  protected

  def incapacities_params
    params.require(:incapacity).permit!
  end

end
