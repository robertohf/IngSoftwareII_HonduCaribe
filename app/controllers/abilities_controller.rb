class AbilitiesController < ApplicationController
  def new
    @ability = Ability.new
  end

  def create
    @ability = Ability.new(abilities_params)

    if @ability.save
      redirect_to work_structures_path, notice: 'Se agrego con exito'
    else
      render :new
    end
end

  protected

  def abilities_params
    params.require(:ability).permit!
  end
end
