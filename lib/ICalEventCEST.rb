class ICalEventCEST
  attr_accessor :tzid, :tzname,:dtstart, :dtend, :summary

  def initialize(year, month, day, hour, summary)
    @ical=""
    @year = year
    @hour = hour
    @day =day
    @month = month
    @summary= summary
    endhour =(hour.to_i) +1
    @dtstart= self.iso8601(@year.to_s, @month.to_s, @day.to_s, @hour.to_s)
    @dtend= self.iso8601(@year.to_s, @month.to_s, @day.to_s, endhour.to_s)
  end

  def iso8601(year, month, day, hour)
    year + month.rjust(2, "0") + day.rjust(2, "0")+ "T" + hour.rjust(2, "0") + "0000"
  end

  def created
    created = Time.now
    created.year
    iso8601(created.year.to_s, created.month.to_s, created.day.to_s,created.hour.to_s)
  end

  def to_s
    @ical+="BEGIN:VCALENDAR\n"
    @ical+="VERSION:2.0\n"
    @ical+="PRODID:-//Flexibits Inc./Fantastical for Mac 3.5.2//EN\n"
    @ical+="PRODID:-//Flexibits Inc./Fantastical for Mac 3.5.2//EN\n"
    @ical+="CALSCALE:GREGORIAN\n"
    @ical+="BEGIN:VTIMEZONE\n"
    @ical+="TZID:Europe/Berlin\n"
    @ical+="X-LIC-LOCATION: Europe/Berlin\n"
    @ical+="BEGIN:DAYLIGHT\n"
    @ical+="TZNAME: CEST\n"
    @ical+="RRULE:FREQ=YEARLY;BYMONTH=3;BYDAY=-1SU\n"
    @ical+="DTSTART:20001029T030000\n"
    @ical+="TZOFFSETFROM:+0200\n"
    @ical+="TZOFFSETTO:+0100\n"
    @ical+="TZOFFSETTO:+0100\n"
    @ical+="END:DAYLIGHT\n"
    @ical+="BEGIN:STANDARD\n"
    @ical+="TZNAME: CET\n"
    @ical+="RULE:FREQ=YEARLY;BYMONTH=10;BYDAY=-1SU\n"
    @ical+="DTSTART:20001029T030000\n"
    @ical+="TZOFFSETFROM:+0200\n"
    @ical+="TZOFFSETTO:+0100\n"
    @ical+="END:STANDARD\n"
    @ical+="END:VTIMEZONE\n"
    @ical+="BEGIN:VEVENT\n"
    @ical+="CREATED:" + self.created.to_s + "\n"
    @ical+="SUMMARY:"+ @summary + "\n"
    @ical+="LAST-MODIFIED:20221014T114230Z\n"
    @ical+="DTEND;TZID=Europe/Berlin:" + @dtend + "\n"
    @ical +="TRANSP:OPAQUE\n"
    @ical +="UID:1B14E0E8-F8B9-4FDA-853D-6AE3F579895F\n"
    @ical +="DTSTART;TZID=Europe/Berlin:" + @dtstart + "\n"
    @ical +="DTSTAMP:"+ self.created.to_s + "\n"
    @ical +="SEQUENCE:1\n"
    @ical +="END:VEVENT\n"
    @ical +="X-APPLE-TRAVEL-ADVISORY-BEHAVIOR:AUTOMATIC\n"
    @ical +="END:VCALENDAR\n"
    return @ical
  end
end
