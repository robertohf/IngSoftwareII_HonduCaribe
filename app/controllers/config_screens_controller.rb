class ConfigScreensController < ApplicationController

	def new
		@config_screen = ConfigScreen.all

		if @config_screen.blank?
			@pantalla_de_config = ConfigScreen.new
		else
			redirect_to edit_config_screen_path(1)
		end
	end

	def create
		@pantalla_de_config = ConfigScreen.new(pantalla_de_config_params)
		
		if @pantalla_de_config.save
			redirect_to root_path
		else
			flash[:errors] = 'No se pudo crear pantalla de configuracion'
			render :new
		end
	end

	def edit
		@pantalla_de_config = ConfigScreen.find(params[:id])
	end

	def update
		@pantalla_de_config = ConfigScreen.find(params[:id])
		
		if @pantalla_de_config.update_attributes(pantalla_de_config_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	protected
		def pantalla_de_config_params
			params.require(:config_screen).permit(:logo, :compania, :mision, :vision)
		end

end
