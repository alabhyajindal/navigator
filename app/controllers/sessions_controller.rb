class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'You are signed in'
    else
      flash.now[:alert] = 'Invalid email/password'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end
end