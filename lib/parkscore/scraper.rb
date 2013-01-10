require 'watir'
require 'watir-webdriver'
require 'logger'
require 'csv'

class Parkscore::Scraper

  def initialize
    @log = Logger.new 'scraper.log'
  end

  def scrape
    @output_csv = init_csv Parkscore::SEED_DATA_CSV
    
    @log.info "Creating browser"
    @browser = Watir::Browser.new
    @log.info("  done")
    city_names().each do |city_name|
      next if city_name.empty?
      city_url = "http://parkscore.tpl.org/city.php?city="+city_name
      @log.info 'Visiting '+city_name
      @browser.goto city_url
      sleep 2
      
      # extract city stats
      acres = @browser.strong(:id=>'cityinfo_acres').text.gsub(/\,/,"")
      median_park_size = @browser.strong(:id=>'cityinfo_medianparksize').text.gsub(/\,/,"")
      park_percentage = @browser.strong(:id=>'cityinfo_parkpercent').text.gsub(/%/,"")
      spending_per_capita = @browser.strong(:id=>'cityinfo_spendingpercapita').text.gsub(/\$/,"")
      playgrounds_per_10k = @browser.strong(:id=>'cityinfo_playgroundsper10k').text
      density = @browser.strong(:id=>'cityinfo_density').text

      # extract park facts
      park_acres = @browser.strong(:id=>'cityinfo_parkacres').text.gsub(/\,/,"")
      people_per_park_acre = @browser.strong(:id=>'cityinfo_peopleperparkacre').text
      population = @browser.span(:id=>'cityinfo_population2').text.gsub(/\,/,"")
  
      # extract rankings
      media_park_size_pts = @browser.span(:id=>'cityinfo_score_medianparksize').text
      park_percentage_pts = @browser.span(:id=>'cityinfo_score_parkpercent').text
      spending_per_capita_pts = @browser.span(:id=>'cityinfo_score_spendingpercapita').text.gsub(/\$/,"")
      playgrounds_per_10k_pts = @browser.span(:id=>'cityinfo_score_playgroundsper10k').text
      accessibility_pts = @browser.span(:id=>'cityinfo_score_accessibility').text
      parkscore = @browser.span(:id=>'cityinfo_parkscore').text
      rank = @browser.span(:id=>'cityinfo_rank').text

      @output_csv << [city_name, acres, median_park_size, park_percentage, spending_per_capita, playgrounds_per_10k, 
              density, park_acres, people_per_park_acre, rank, population, 
              media_park_size_pts, park_percentage_pts, spending_per_capita_pts, playgrounds_per_10k_pts, 
              accessibility_pts,
              parkscore]

      @log.info '  ranked: '+rank

    end

    @browser.quit

  end

  private

    def init_csv file
      csv = CSV.open(file,'wb')
      csv << ["name", "acres", "median_park_size", "park_percentage", "spending_per_capita", "playgrounds_per_10k", 
        "density", "park_acres", "people_per_park_acre", "rank", "population", 
        "score_median_park_size", "score_park_percentage", "score_spendingpercapita", "score_playgrounds_per_10k",
        "score_accessibility",
        "parkscore"]
    end

    def city_names
      @log.info "Opening homepage"
      @browser.goto 'http://parkscore.tpl.org'
      city_names = @browser.select_list(:id => "pickcity").options.collect {|city_option| city_option.value.strip}
      @log.info "  fetched city names"
      city_names
    end

end
