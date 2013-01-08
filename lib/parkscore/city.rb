
class Parkscore::City

  attr_accessor :name, :score, :median_park_size, :park_percentage, :playgrounds_per_10k, :spending_per_capita, :access_percentage

  def self.fromCsvRow row
    city = self.new
    city.name = row[0]
    city.score = Float(row[11])
    city.median_park_size = Float(row[2])
    city.park_percentage = Float(row[3])
    city.playgrounds_per_10k = Float(row[5])
    city.spending_per_capita = Float(row[4])
    city
  end

end