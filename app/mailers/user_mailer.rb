class UserMailer < ApplicationMailer
  default from: 'catanzaro-ristorante.com'

  def reservation_email(user)
    @user = user
    @user_reservation = @user.reservations.find_by(:user_id => @user.id)
    mail(to: @user.email, subject: 'Reservation Confirmation')
  end
end
