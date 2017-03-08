class UserMailer < ApplicationMailer
  default from: 'catanzaro-ristorante.com'

  def reservation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Reservation Confirmation')
  end
end
