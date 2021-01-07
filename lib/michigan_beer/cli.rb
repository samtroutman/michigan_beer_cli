class MichiganBeer::CLI

    def call
        get_beers
        list_beers
        menu
        goodbye
    end

    def get_beers
        Scraper.new.scrape_page
    end

    def list_beers
        puts "Top Michigan Beers"
        Beer.all.each do |beer|
            puts "#{beer.number}. #{beer.name}"
        end
    end

    def menu
       
        input = nil
        while input != "exit"
        puts "Enter the number of the beer you'd like more information on, type list to see the beers again, or exit to exit:"
        input = gets.strip
        
        if input.to_i > 0
            puts @beer[input.to_i-1]
        elsif input == "list"
            list_beers        
        elsif 
            puts "Error: please type list or exit."
        end
    end
    end

    def goodbye
        puts "Goodbye!"
    end

end