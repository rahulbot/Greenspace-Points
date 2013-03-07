
class Greenspacepoints

  SEED_DATA_CSV = 'lib/greenspacepoints/data/seed_data.csv'

  def self.getCalculator
    Calculator.new SEED_DATA_CSV
  end

end

require 'greenspacepoints/calculator.rb'
require 'greenspacepoints/scraper.rb'
