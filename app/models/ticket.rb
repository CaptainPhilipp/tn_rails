class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :departure, class_name: 'RailwayStation'
  belongs_to :arrival,   class_name: 'RailwayStation'

  after_create  :mail_notification_buy
  after_destroy :mail_notification_abort

  def route_title
    "#{departure.title} - #{arrival.title}"
  end

  def mail_notification_buy
    TicketsMailer.buy_ticket(self).deliver_now
  end

  def mail_notification_abort
    TicketsMailer.abort_ticket(self).deliver_now
  end
end
