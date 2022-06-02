class UserMailer < ApplicationMailer
  default from: 'noreply@pharmacy-ri2022.herokuapp.com'

  def welcome_email
    @user = params[:user]
    @site_url = 'pharmacy-ri2022.herokuapp.com'
    @login_url = 'https://pharmacy-ri2022.herokuapp.com/users/sign_in'

    mail(to: @user.email, subject: 'Вітаємо у Pharmacy-RI2022')
  end

end
