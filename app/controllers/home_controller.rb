class HomeController < ApplicationController
  def index
  	@config_screens = ConfigScreen.all
  end
end
