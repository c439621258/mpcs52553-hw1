# DO NOT MODIFY THIS FILE

require 'csv'

class MilesTable

  def MilesTable.info_for(airport)
    data = read_data_file
    return data[airport.upcase]
  end

  def MilesTable.read_data_file
    data = {}
    CSV.foreach('miles.csv', headers: true) do |row|
      data[row['dest']] = { miles: row['miles'],
                            duration: row['duration'],
                            tz_offset: row['tz_offset'],
                            flight_number: row['flight_num']}
    end
    return data
  end

  def MilesTable.generate_flights(days = 1)
    data = read_data_file
    puts 'date,fltnum,destination,departure_time,duration,arrival_time,earned_miles'
    days.times do |day_number|
      data.keys.sample(4).each_with_index do |destination, hour|
        flight_number = data[destination][:flight_number]
        date = Date.parse('2017-06-01') + day_number
        departure_hour = 9 + hour
        departure_time = "%02d00" % departure_hour
        minutes = data[destination][:duration].to_i
        arrival_hour = departure_hour + data[destination][:tz_offset].to_i + (minutes / 60)
        arrival_time1 = "%02d" % arrival_hour
        arrival_time2 = "%02d" % (minutes % 60)
        arrival_time = "#{arrival_time1}#{arrival_time2}"
        miles = data[destination][:miles]
        puts [date,flight_number,destination,departure_time,minutes,arrival_time,miles].join(',')
      end
    end
  end
end
