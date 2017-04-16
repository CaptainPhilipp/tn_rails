class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :departure, class_name: 'RailwayStation'
  belongs_to :arrival,   class_name: 'RailwayStation'

  after_create :send_mail_notification

  def route_title
    "#{departure.title} - #{arrival.title}"
  end

  def send_mail_notification
    TicketsMailer.buy_ticket(user, self).deliver_now
  end
end
