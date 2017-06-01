class UsersController < ApplicationController
  skip_before_action :authenticate, only: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: 'El Usuario se agrego exitosamente'
    else
      flash[:error] = 'No se pudo registrar el usuario, Favor corregir los siguientes errores: '
      render :new
    end
  end

  def campaigns
    @user = current_user
    @campaigns = @user.campaigns
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)

    if @user.update_attributes(user_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :password, :country, :city, :email_notification)
  end

  def user_edit_params
    params.require(:user).permit(:name, :email, :country, :city, :email_notification)
  end
end
