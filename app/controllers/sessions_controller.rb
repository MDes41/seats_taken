class SessionsController < ApplicationController
  def new
  end

  def create

    @user = User.find_by(email: params[:sessions][:email])
    if @user && @user.authenticate(params[:sessions][:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash.now[:danger] = 'Unable to authorize user, please login or create an account'
      render :new
    end
  end

  def destroy
    user = User.find(current_user.id)
    if user.destroy
      session[:user_id] = nil
      redirect_to root_path
    else
      flash.now[:danger] = "Please try loggin out again"
    end
  end
end
