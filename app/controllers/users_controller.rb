class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(new_user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Thank you for creating a new account'
      redirect_to dashboard_path
    else
      flash.now[:danger] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  private
    def new_user_params
      params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
    end
end
