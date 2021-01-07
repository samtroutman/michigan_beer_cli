require 'open-uri'

class Scraper

    attr_accessor :beer

    def scrape_page
        url_str = "https://www.beeradvocate.com/beer/top-rated/us/mi/"
        uri = URI(url_str)
        response = Net::HTTP.get(uri)
        doc = Nokogiri::HTML(response)
        beer_list = doc.css('#ba-content').css("table")
        #ba-content > table > tbody > tr:nth-child(2)
        # .css("tbody")
        # .first.css('td')
        
        beer_list.each_with_index do |beer, i|
            binding.pry
            new_beer = Beer.new
            new_beer.name = beer.css('b').text
            new_beer.number = i 
            new_beer.abv = beer.text.split(' | ')[1]
            new_beer.brewery = beer.text.split(' | ')[0]
        end
    end


end