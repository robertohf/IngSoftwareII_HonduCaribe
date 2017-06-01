class WorkStructureAbilitiesController < ApplicationController
  def new
    @work_structure_ability = WorkStructureAbility.new
  end

  def create
    @work_structure = WorkStructure.find(params[:work_structure_id])
    @work_structure_ability = @work_structure.work_structure_abilities.build(work_structure_abilities_params)

    if @work_structure_ability.save
      redirect_to @work_structure, notice: 'Se agrego con exito'
    else
      render :new
    end
end

  protected

  def work_structure_abilities_params
    params.require(:work_structure_ability).permit!
  end
end
