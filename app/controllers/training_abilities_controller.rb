class TrainingAbilitiesController < ApplicationController
  def new
    @training = Training.find(params[:training_id])
    @training_ability = @training.training_abilities.build
  end

  def create
    @training = Training.find(params[:training_id])
    @training_ability = @training.training_abilities.build(training_abilities_params)

    if @training_ability.save
      redirect_to @training, notice: 'Se agrego con exito'
    else
      render :new
    end
end

  protected

  def training_abilities_params
    params.require(:training_ability).permit!
  end
end
