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
      render :new
    end
 end

  protected

  def instructor_params
    params.require(:instructor).permit!
  end
end
