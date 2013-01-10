
class Parkscore::City

  attr_accessor :name, :acres, :median_park_size, :park_percentage, :spending_per_capita, :playgrounds_per_10k, :pop_per_acre,
    :park_acres, :people_per_park_acre, :rank, :population, :median_park_size_score, :park_percentage_score, :spending_per_capita_score,
    :playgrounds_per_10k_score, :accessibility_score, :parkscore, :access_percentage

  def self.fromCsvRow row
    # couldn't scrape these, so gotta do it by hand :-(
    city_name_to_access_percentage = {
      'Albuquerque'=> '0.81' ,
      'Atlanta'=> '0.63' ,
      'Austin'=> '0.49' ,
      'Baltimore'=> '0.85' ,
      'Boston'=> '0.97' ,
      'Charlotte'=> '0.26' ,
      'Chicago'=> '0.9' ,
      'Columbus'=> '0.49' ,
      'Dallas'=> '0.54' ,
      'Denver'=> '0.79' ,
      'Detroit'=> '0.77' ,
      'El Paso'=> '0.47' ,
      'Fort Worth'=> '0.52' ,
      'Fresno'=> '0.35' ,
      'Houston'=> '0.45' ,
      'Indianapolis'=> '0.32' ,
      'Jacksonville'=> '0.35' ,
      'Kansas City'=> '0.64' ,
      'Las Vegas'=> '0.46' ,
      'Long Beach'=> '0.70' ,
      'Los Angeles'=> '0.52' ,
      'Louisville'=> '0.32' ,
      'Memphis'=> '0.40' ,
      'Mesa'=> '0.60' ,
      'Milwaukee'=> '0.87' ,
      'Nashville'=> '0.36' ,
      'New York'=> '0.96' ,
      'Oklahoma City'=> '0.43' ,
      'Philadelphia'=> '0.91' ,
      'Phoenix'=> '0.44' ,
      'Portland'=> '0.78' ,
      'Sacramento'=> '0.77' ,
      'San Antonio'=> '0.32' ,
      'San Diego'=> '0.75' ,
      'San Francisco'=> '0.98' ,
      'San Jose'=> '0.69' ,
      'Seattle'=> '0.90' ,
      'Tucson'=> '0.52' ,
      'Virginia Beach'=> '0.62' ,
      'Washington'=> '0.96'
    }

    city = self.new
    city.name = row[0]
    city.acres = Float(row[1])
    city.median_park_size = Float(row[2])
    city.park_percentage = Float(row[3])
    city.spending_per_capita = Float(row[4])
    city.playgrounds_per_10k = Float(row[5])
    city.pop_per_acre, = Float(row[6])
    city.park_acres = Float(row[7])
    city.people_per_park_acre = Float(row[8])
    city.rank = Float(row[9])
    city.population = Float(row[10])
    city.median_park_size_score = Float(row[11])
    city.park_percentage_score = Float(row[12])
    city.spending_per_capita_score, = Float(row[13])
    city.playgrounds_per_10k_score = Float(row[14])
    city.accessibility_score = Float(row[15])
    city.parkscore = Float(row[16])
    city.access_percentage = Float(city_name_to_access_percentage[city.name])
    city
  end

end