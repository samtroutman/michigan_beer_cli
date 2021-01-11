require 'open-uri'

class Scraper

    attr_accessor :beer

    def self.scrape_page
        url_str = "https://www.beeradvocate.com/beer/top-rated/us/mi/"
        uri = URI(url_str)
        response = Net::HTTP.get(uri)
        doc = Nokogiri::HTML(response)

        rows = doc.css('#ba-content table tr')

        results = (2..26).collect {|index| parse_row(rows[index-1])}
    end


    def self.parse_row(row)
        {
          :name => row.children[1].children[0].children[0].children[0].text,
          :brewery => row.children[1].children[1].children[1].text,
          :style => row.children[1].children[1].children[3].text,
          :abv => row.children[1].children[1].children[4].text,
          :rank => row.children[0].text,
          :rating => row.children[3].children[0].text
        }
      end



end