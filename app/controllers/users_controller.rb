class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Thanks Signing up!'
    else
      render :new
    end
  end

  private
  def allowed_params
    params.require(:user).permit(:email,:name, :password, :password_confirmation)
  end
end
