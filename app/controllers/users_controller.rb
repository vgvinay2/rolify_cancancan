class UsersController < ApplicationController

  # Cancancan add a before filter to access the methods
  # gives problems with strong parameters if using cancan insted of cancancan.
  load_and_authorize_resource

  
  def index
    @users = User.all
  end

  def new
    @roles = Role.all
  	@user = User.new
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
    add_roles(@user)

  	if @user.save
  		redirect_to root_url, :notice => "sign_up!"
  	else
  		render "new"
  	end
  end

  def update
      @user = User.find(params[:id])
      add_roles(@user)
      redirect_to users_path, notice: 'User was successfully updated.' 
  end



  private
  def add_roles(resource)
    resource.roles = []
    unless params[:user][:role_ids].blank?
      params[:user][:role_ids].each do |role|
        resource.add_role Role.find(role).name
      end
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end