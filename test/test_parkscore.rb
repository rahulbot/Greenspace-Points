require 'test/unit'
require 'parkscore'

class ParkscoreTest < Test::Unit::TestCase

  def setup
    @calc = Parkscore.getCalculator
    @albuquerque = @calc.cities[0]
    @albuquerque.access_percentage = 0.81
  end

  def test_csv_load
    assert_equal 40, @calc.cities.length
  end

  def test_city_acreage_score
    assert_equal 28, @calc.acreage_score(@albuquerque)
  end

  def test_city_services_score
    assert_equal 18, @calc.services_score(@albuquerque)
  end

  def test_city_access_score
    assert_equal 32, @calc.access_score(@albuquerque)
  end

  def test_city_final_parkscore
    assert_equal 75, @calc.score(@albuquerque)
  end

end

