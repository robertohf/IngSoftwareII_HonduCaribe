class InstructorsController < ApplicationController
  def new
    @institution = Institution.find(params[:institution_id])
    @instructor = @institution.instructors.build
 end

  def create
    @institution = Institution.find(params[:institution_id])
    @instructor = @institution.instructors.build(instructor_params)

    if @instructor.save
      redirect_to @institution, notice: 'Se agrego con exito'
    else
      redirect_to @institution, notice: 'Ingrese nombre correcto'
    end
 end

 def destroy
   @instructor = Instructor.find(params[:id])
   @instructor.destroy
   redirect_to institutions_path, notice: 'Se borro con exito companero'

  end


  protected

  def instructor_params
    params.require(:instructor).permit!
  end
end
