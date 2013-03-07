require 'test/unit'
require 'greenspacepoints'

class GreenspacepointsTest < Test::Unit::TestCase

  def setup
    @calc = Greenspacepoints.getCalculator
    @albuquerque = @calc.cities[0]
  end

#  def test_recalculate_seed_scores
#    errors = 0
#    @calc.cities.each do |city|
#      errors+=1 if (@calc.score(city)-city.greenspacepoints).abs > 1
#    end
#    assert_equal 0, errors
#  end

  def test_csv_load
    assert_equal 40, @calc.cities.length
  end

  def test_city_median_park_size_score
    assert_equal @albuquerque.median_park_size_score, @calc.score_for(:median_park_size, @albuquerque.median_park_size)
  end

  def text_city_park_percentage_score
    assert_equal @albuquerque.park_percentage_score, @calc.score_for(:park_percentage, @albuquerque.park_percentage)
  end

  def test_city_acreage_score
    assert_equal (@albuquerque.median_park_size_score + @albuquerque.park_percentage_score), @calc.acreage_score(@albuquerque)
  end

  def text_city_spending_per_capita_score
    assert_equal @albuquerque.spending_per_capita_score, @calc.score_for(:spending_per_capita, @albuquerque.spending_per_capita)
  end

  def test_city_playgrounds_per_10k_score
    assert_equal @albuquerque.playgrounds_per_10k_score, @calc.score_for(:playgrounds_per_10k, @albuquerque.playgrounds_per_10k)
  end

  def test_city_services_score
    assert_equal (@albuquerque.spending_per_capita_score+@albuquerque.playgrounds_per_10k_score), @calc.services_score(@albuquerque)
  end

  def test_city_access_score
    assert_equal @albuquerque.accessibility_score, @calc.access_score(@albuquerque)
  end

  def test_city_final_greenspacepoints
    assert_equal @albuquerque.greenspacepoints, @calc.score(@albuquerque)
  end

end

