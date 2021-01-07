class MichiganBeer::Beer

    attr_accessor :name, :number, :abv, :type, :brewery, :scraper

    @@all = []

    def initialize(name = "", number = 1, abv = "", type = "", brewery = "")
        @name = name
        @number = number
        @abv = abv
        @type = type
        @brewery = brewery
        @@all << self
    end

    def self.all
        @@all
    end    

end