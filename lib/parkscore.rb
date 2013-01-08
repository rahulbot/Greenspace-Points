
class Parkscore

  SEED_DATA_CSV = 'lib/parkscore/data/seed_data.csv'

  def self.getCalculator
    Calculator.new SEED_DATA_CSV
  end

end

require 'parkscore/calculator.rb'
require 'parkscore/scraper.rb'
