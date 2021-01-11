class MichiganBeer::Beer

    attr_accessor :name, :rank, :abv, :style, :brewery, :rating

    @@all=[]

    def initialize(beer_hash)
        beer_hash.each {|key, value| self.send(("#{key}="), value)}
        @@all << self
      end

    def self.all
        if @@all.count==0
            Scraper.scrape_page.each {|hash| self.new(hash)}
        end
        @@all 
    end

    def self.find(id)
        self.all[id-1]
    end



end