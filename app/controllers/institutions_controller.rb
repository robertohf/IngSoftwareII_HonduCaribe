class InstitutionsController < ApplicationController

  def index
    @institutions = Institution.all
  end

  def new
    @institution = Institution.new
  end

  def create
    @institution = Institution.new(institution_params)

    if @institution.save
      redirect_to institutions_path, notice: 'Se agrego con exito'
    else
      render :new
    end
  end

  def show
    @institution = Institution.find_by_id(params[:id])
    @instructor = @institution.instructors.build
  end

  def destroy
    @institution = Institution.find(params[:id])
    @institution.DeleteReferences
    @institution.destroy
    redirect_to institutions_path, notice: 'Se borro con exito companero'

   end

  protected

  def institution_params
    params.require(:institution).permit!
  end
end
