class UsersController < ApplicationController
  def new
    @roles = Role.all
  	@user = User.new
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