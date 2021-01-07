require 'open-uri'

class Scraper

    attr_accessor :beer

    def scrape_page
        uri = "https://www.beeradvocate.com/beer/top-rated/us/mi/"
        binding.pry

        doc = Nokogiri::HTML(open(uri))
        beer_list = doc.css('#ba-content').css('table').first.css('td')
        beer_list.each_with_index(1) do |beer, i|
            new_beer = Beer.new
            new_beer.name = beer.css('b').text
            new_beer.number = i 
            new_beer.abv = beer.text.split(' | ')[1]
            new_beer.brewery = beer.text.split(' | ')[0]
        end
    end


end