require 'ICalEventCEST'

class AppointmentMailer < ApplicationMailer
  default from: 'Holger Kraus <depot@example.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.booked.subject
  #
  def booked(email, year, month ,day, hour)
    iCalEvent=ICalEventCEST.new(year, month, day, hour[0,2] , "Ich besuche Holger");

    attachments['Besuch.ics'] =iCalEvent.to_s
    @greeting = "Hi"
    @day=day
    @zeit=hour[0,2] + ":00";
    mail to: email, subject: "Glückwunsch, Du hast einenen Termin bei Holger!"
  end
end
