class SessionsController < ApplicationController
  before_filter :require_visitor, only: [:new, :create]
  before_filter :require_user, only: :destroy

  def new
    render layout: 'blank'
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.name}"
      redirect_to root_path
    else
      flash[:danger] = "Incorrect email or password"
      render :new, layout: 'blank'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Bye bye, until next time!"
    redirect_to root_path
  end

  private

  def session_params
    params.permit(:email, :password, :password_confirmation)
  end

end