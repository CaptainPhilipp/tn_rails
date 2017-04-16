class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    @locale_hash = { locale: I18n.default_locale } # user.locale ?
    mail(to: @user.email, subject: 'Покупка билета')
  end
end
