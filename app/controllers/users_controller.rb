class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    name, email = user_params.values_at(:name, :email)
    fail
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_url, notice: 'Account updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, alert: 'Account deleted.'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
