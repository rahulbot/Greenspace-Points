#!/usr/bin/env ruby
require 'greenspacepoints'

calc = Greenspacepoints::getCalculator

city = Greenspacepoints::City.new
city.name = "NowhereVille"

# the median size of all the public parks in your town, in acres
city.median_park_size = 1.6

# the percentage of city area that is public park lands
city.park_percentage = 16

# how much money per person is spent per year on parks and recreation (in dollats)
city.spending_per_capita = 200.23

# how many playgrounds are there (per 100,000 people)
city.playgrounds_per_10k = 3

# what percentage of the population lives within a half-mile walk of a park entrance
city.access_percentage = 0.6

score = calc.score(city)

print "The city of "+city.name+" has about "+score.to_s+" GreenspacePoints\n"