class UsersController < ApplicationController

  def new
    redirect_to root_path and return if user_logged_in?

    @user = User.new
    render layout: 'blank'
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Your account has been created, please login below."
      redirect_to login_path
    else
      render 'new', layout: 'blank'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end