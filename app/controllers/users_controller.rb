class UsersController < ApplicationController
  def new
    @roles = Role.all
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    
    #@user.add_role params['role_ids']

  	if @user.save
  		redirect_to root_url, :notice => "sign_up!"
  	else
  		render "new"
  	end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end