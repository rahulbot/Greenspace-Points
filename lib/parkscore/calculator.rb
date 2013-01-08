require 'csv'
require 'parkscore/city.rb'

class Parkscore::Calculator

  BUCKETS = 20

  attr_accessor :cities

  def initialize(seed_data_csv)
    @cities = Array.new
    # load all the sample data scraped from their website
    CSV.foreach(seed_data_csv,:headers=>:first_row) do |row|
      city = Parkscore::City::fromCsvRow row 
      cities.push city
    end
  end

  def min_for property
    all_values(property).min
  end

  def max_for property
    all_values(property).max
  end

  def median_for property
    sorted = all_values(property).sort
    len = sorted.length
    # http://stackoverflow.com/questions/2967586/finding-the-highest-lowest-total-average-and-median-from-an-array-in-ruby
    (len % 2 == 1) ? sorted[len/2] : (sorted[len/2 - 1] + sorted[len/2]).to_f / 2
  end

  # http://parkscore.tpl.org/methodology.php
  def score city
    100* ( (acreage_score(city) + services_score(city) + access_score(city)) / 120.0)
  end

  def acreage_score city
    score_for(:median_park_size, city.median_park_size) + 
      score_for(:park_percentage, city.park_percentage)
  end

  def services_score city
    score_for(:playgrounds_per_10k, city.playgrounds_per_10k) +
      score_for(:spending_per_capita, city.spending_per_capita)
  end

  def access_score city
      2.0*score_for_access(city.access_percentage)
  end

  private 

    def score_for_access value
      # I couldn't scrape these values on a per-city basis (they are only in the PDF reports),
      # so I just copied these from the methodology page on the website
      min = 0.26
      max = 0.97
      median = 0.50
      score_from_details_for value, min, max, median
    end       
  
    def score_for property, value
      min = min_for property
      max = max_for property
      median = median_for property
      score_from_details_for value, min, max, median
    end

    def score_from_details_for value, min, max, median
      threshold = 2.0*median
      bucket_size = (threshold - min) / BUCKETS
      return BUCKETS if value > threshold
      (value - min) / bucket_size
    end

    def all_values property
      @cities.collect { |city| city.send(property) }
    end

end
