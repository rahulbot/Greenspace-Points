ParkScore Calculator
====================

The Trust for Public Land has developer the ParkScore process and algorithm for evaluating how 
well cities are meeting the need for parks.  It did this for the biggest 40 cities in the US.  The
process is quite involved, but I saw a chance to provide an 80/20 solution that let other cities
figure out their parkscore quickly.  This of course doesn't supply all the analysis that TPL did 
to think about need areas and so on, but I think it is still a useful first step to help cities
subscribe to this park-oriented way of thinking.


Aggregate Data
--------------

The algorithm requires some of the aggregate data TPL generated to work.  To get this I wrote
a simple website scraper.  The results are store in `lib/parkscore/data/`.  You shouldn't need to 
regenerate this, but if you do first make sure you have Firefox installed.  Then do this:

```
gem install watir
ruby -Ilib ./bin/scrape_seed_data.rb 
```

Testing
-------

I added some simple unit tests to make sure my implementation of the algorithm is correct.  The test
do this by recalculating the scores for cities they have already scored.  If the code is right, the 
number it computes should match the number they computed.

```
rake test
```
