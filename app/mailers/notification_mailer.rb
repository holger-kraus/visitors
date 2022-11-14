class NotificationMailer < ApplicationMailer
  default from: 'Holger Kraus <herr.holger.kraus@googlemail.com>'
  def notify(email, year, month ,day, hour, booker)
    @bookker =booker
    iCalEvent=ICalEventCEST.new(year, month, day, hour[0,2] , booker+" besucht Holger");

    attachments['Besuch.ics'] =iCalEvent.to_s
    @greeting = "Hi"
    @day=day
    @zeit=hour[0,2] + ":00";
    mail to: "holger.kraus@posteo.de", subject: booker+ " besucht Holger"
  end
end
