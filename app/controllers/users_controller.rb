class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  #para validar autorizacion de acceso de los usuarios
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    authorize! :read , @users
  end

  def new
    authorize! :read , @user
    #@user = User.new
  end

  def user_edit
    authorize! :read , @user
    @user = User.find(params[:id])
    @pass = params[:password]
  end

  def edit
    authorize! :read , @user
  end


  def update

    if @user.update(user_params)
      flash[:notice] = 'Usuario actualizado exitosamente'
      redirect_to users_index_path
    else
      flash[:notice] = 'No se ha podido actualizar usuario'
      redirect_to users_index_path
    end
  end

  def destroy

    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = 'usuario eliminado exitosamente'
      redirect_to users_path
    else
      flash[:notice] = 'Error al eliminar usuario'
      redirect_to users_path
    end

  end


  def create_user
    email = params[:email]
    password = params[:password]

    user = User.new(:email => email, :password => password, :admin => false)
    if user.save
      flash[:notice] = 'Usuario agregado exitosamente'
      redirect_to users_index_path
    else
      flash[:notice] = 'Error al agregar usuario'
      redirect_to users_index_path
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email,:password ,:admin)
  end

end
