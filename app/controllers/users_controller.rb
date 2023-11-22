class UsersController < ApplicationController
  def create
    email = user_params[:email]
    user = User.find_by(email: email)

    if user
      # User with the given email already exists, update the user
      user.update(name: user_params[:name])
    else
      # User with the given email doesn't exist, create a new user
      user = User.create(user_params)
    end

    # Additional code or redirects as needed
    sgid = user.to_sgid(expires_in: 24.hours, for: "login").to_s

    # Send login email with the sgid
    UserMailer.with(user: user, sgid: sgid).login_email.deliver_now

    redirect_to inbox_path

  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, alert: 'Account deleted.'
  end

  def verify
  end

  def login
    sgid = params.require(:token)
    user = GlobalID::Locator.locate_signed(sgid, for: "login")

    if user.nil? || !user.is_a?(User)
      redirect_to root_url
    else
      session[:user_id] = user[:id]
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
