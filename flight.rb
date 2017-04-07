# DO NOT MODIFY THIS FILE

require 'csv'   # activates the built-in CSV library in Ruby 2.x
                # examples: https://docs.ruby-lang.org/en/2.2.0/CSV.html

class Flight

  def Flight.all
    data = []
    CSV.foreach('flights.csv', headers: true) do |row|
      data.push(row)
    end
    return data
  end

  def Flight.find_by(date:, flight_number:)
    data = Flight.all
    data.select { |row| row['date'] == date && row['fltnum'] == flight_number }
  end

end
