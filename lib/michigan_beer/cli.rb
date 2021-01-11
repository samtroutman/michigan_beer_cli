class MichiganBeer::CLI

    def start
        list_beers
        menu
    end


    def list_beers
        puts "Top Michigan Beers"
        MichiganBeer::Beer.all.each do |beer|
            puts "#{beer.rank} - #{beer.name}"
        end
    end

    def menu
        input = nil
        while input != "exit"
        puts "Enter the number of the beer you'd like more information on, type list to see the beers again, or exit to exit:"
        input = gets.strip.downcase 
        if input.to_i.between?(1,25)
            puts beer_details(input)
        elsif input == "list"
            list_beers   
        elsif input == "exit"
            goodbye
        else 
            puts "Error: please type list or exit."
        end
    end
    end

    def beer_details(num = 1)
        selection = nil
        beer = MichiganBeer::Beer.find(num.to_i)
        puts "Name: #{beer.name}"
        puts "Brewery: #{beer.brewery}"
        puts "Style & ABV: #{beer.style} #{beer.abv}"
        puts "Average Rating: #{beer.rating}"
    end
        

    def goodbye
        puts "Goodbye!"
    end

end