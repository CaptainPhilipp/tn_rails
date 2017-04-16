class TicketsMailer < ApplicationMailer
  before_action :set_locale_hash

  def buy_ticket(ticket)
    @ticket = ticket
    @user   = ticket.user
    mail(to: @user.email, subject: 'Покупка билета')
  end

  def abort_ticket(ticket)
    @ticket = ticket
    @user   = ticket.user
    mail(to: @ticket.user.email, subject: 'Отмена билета')
  end

  private

  def set_locale_hash
    @locale_hash = { locale: I18n.default_locale } # user.locale ?
  end
end
