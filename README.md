ParkScore Calculator
====================

The Trust for Public Land has developer the [ParkScore](http://parkscore.tpl.org) process and algorithm 
for evaluating how well cities are meeting the need for parks.  It did this for the biggest 40 cities in 
the US.  The process is quite involved, but I saw a chance to provide an 80/20 solution that let other cities
figure out their ParkScore quickly.  This Ruby library can be used to compute your own city's ParkScore,
if you know all the right inputs.  That isn't trivial.  This of course doesn't supply all the cool 
analysis that TPL did to think about need areas and so on, but I think it is still a useful first 
step to help cities subscribe to this park-oriented way of thinking.

Example
-------

You need to know a bunch of things to compute your ParkScore.  Like I said, these can take a long time
and effort to figure out.  Here's the list:
* the median size of all the public parks in your town, in acres
* the percentage of city area that is public park lands
* how much money per person is spent per year on parks and recreation (in dollars)
* how many playgrounds are there (per 100,000 people)
* what percentage of the population lives within a half-mile walk of a park entrance

Once you have all that, open up the `score_my_city.rb` and fill them in.  Then run this:
```
ruby -Ilib score_my_city.rb
```

Testing
-------

I added some simple unit tests to make sure my implementation of the algorithm is correct.  The test
do this by recalculating the scores for cities they have already scored.  If the code is right, the 
number it computes should match the number they computed.

```
rake test
```

It gets pretty close.

Aggregate Data
--------------

The algorithm requires some of the aggregate data TPL generated to work.  To get this I wrote
a simple website scraper.  The results are store in `lib/parkscore/data/`.  You shouldn't need to 
regenerate this, but if you do first make sure you have Firefox installed.  Then do this:

```
gem install watir
ruby -Ilib ./bin/scrape_seed_data.rb 
```
