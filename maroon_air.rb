# Usage:
#    ruby maroon_air.rb /flights
#    ruby maroon_air.rb /flights/{date}/{flight_number}
#
#    For example:
#    ruby maroon_air.rb /flights/2017-06-02/777
require 'time'
require 'json'
require "./flight"
def display_all
  # 1. TO DO: use the Flight class instead, e.g.:
  #    Flight.all
  #
  #    and then use the returned data to generate the template below.

  puts "Date       Flt# Dest Leaves At Arrives At Miles Earned"
  puts "---------- ---- ---- --------- ---------- ------------"

  # get the array of flight information dictionary
  dicts = Flight.all

  # use a for loop to format the out put
  dicts.each do |p|
    printf "%s %4d  %s %9s %9s %13d\n", p['date'], p['fltnum'], p['destination'], p['departure_time'], p['arrival_time'], p['earned_miles']
  end
end

def show_flight_details(the_date, the_flight_number)
  # 2. TO DO: use the following instead:
  #    Flight.find_by(date: the_date, flight_number: the_flight_number)
  #
  #    and then display flight information just like the template below.

  # get the found flight information dictionary  
  dict = Flight.find_by(date:the_date, flight_number:the_flight_number)[0]
  puts "Date: " + dict['date']
  puts "Flight: #" + dict['fltnum']
  puts "From: ORD"
  puts "To  : " + dict['destination']
  puts 

  # change the time formate to 12 hour format
  puts "Departs At: " + Time.strptime(dict['departure_time'], "%H%M").strftime("%I:%M%P")
  puts "Arrives At: " + Time.strptime(dict['arrival_time'], "%H%M").strftime("%I:%M%P")
  puts
  puts "Frequent Flyer Miles: " + dict['earned_miles']
  puts
  puts "All times shown are local."
end

#################################################
# Main Program - Do Not Touch
#################################################

path = ARGV.first

if path == '/flights'
  display_all
else
  date, flight_number = path.split('/')[2..3]
  show_flight_details(date, flight_number)
end
