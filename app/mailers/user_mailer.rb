class UserMailer < ApplicationMailer
  default from: 'Alabhya <alabhya@auratice.com>' # this domain must be verified with Resend
  def login_email
    @user = params[:user]
    @email = @user["email"]
    @sgid = params[:sgid]
    @url = "http://auratice.com/login?token=#{@sgid}"
    mail(to: [@email], subject: 'Login to Navigator')
  end
end
