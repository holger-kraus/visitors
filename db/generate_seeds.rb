require 'Date'
$stdout = File.open("db/seeds.rb", "w")
puts "DatabaseCleaner.clean_with(:truncation)"
Wochentage=["Montag" , "Dienstag", "Mittwoch",  "Donnerstag" ,  "Freitag" , "Samstag", "Sonntag"];
startdate =Date.new(2022, 10, 23)
enddate = Date.new(2023, 10, 22)
timeslot_map ={"Montag"=>["14:00","15:00", "16:00", "17:00"],
               "Dienstag"=>["14:00","15:00","16:00","17:00"],
               "Mittwoch"=>["14:00","15:00", "16:00","17:00"],
               "Donnerstag"=>["14:00","15:00", "16:00","17:00"],
               "Freitag"=>["14:00","15:00", "16:00","17:00"],
               "Samstag"=>["11:00","12:00","13:00","14:00","15:00","16:00","17:00"],
               "Sonntag"=>["11:00","12:00","13:00","14:00","15:00","16:00","17:00"]}

def week_name_key(day)
  Wochentage[day.wday-1]
end

def week_day_name(day)
  "#{Wochentage[day.wday-1]},der #{day.strftime("%e.%m.")}"
end
def week_name (first_day)
  last_day = first_day + 7
  "KW#{first_day.cweek}, #{first_day.strftime("%e.%m.%Y")} - #{last_day.strftime("%e.%m.%Y")}"
end

def create_week(week_id, day)
  fromTimestamp=day.to_time;
  endTimestamp=(day+7).to_time;
  puts "Week.create({id:#{week_id},firstday: '#{fromTimestamp}', lastday: '#{ endTimestamp}',previous:#{week_id-1}, next:#{week_id+1}, name: '#{week_name day}'});"
end

def create_day ( day_id,week_id, week_day)
  tstamp=(week_day+1).to_time
  puts "   Day.create ({id:#{day_id}, name: '#{week_day_name week_day}',tstamp:'#{tstamp}', week_id:#{week_id} });"
end

def create_timeslot(timeslot_id, day_id, timeslot)
  puts "      Timeslot.create({id:#{timeslot_id}, name:'#{timeslot}', day_id:#{day_id}});"
end


# (Date.new(2012, 01, 01)..Date.new(2012, 01, 30)).each { |date|
#   first_day= day
#   last_day = day + 7
#
#   <%  (first_day..last_day).each do |week_day|
# }
day_id=1
weekid=1
timeslot_id=1
(startdate..enddate).step(7).each do |day|
  create_week(weekid, day)
  first_day= day
  last_day = day + 7
  (first_day..last_day).each do |week_day|
    create_day(day_id, weekid, week_day)

    wochentag=week_name_key(week_day)
    timeslots= timeslot_map[week_name_key week_day]
    timeslots.each do |timeslot|
      create_timeslot timeslot_id, day_id, timeslot
      timeslot_id= timeslot_id +1
    end
    day_id= day_id +1
  end
  weekid= weekid + 1
  puts "
       "
end