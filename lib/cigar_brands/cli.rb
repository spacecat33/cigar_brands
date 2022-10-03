
class CigarBrands::CLI 
    @@grn="\e[1;32m"
    @@white="\e[0m"
    @@blu="\e[1;34m"
    @@cyn="\e[1;36m"

    def call
        puts ""
        puts "\n#{@@grn}Welcome to Cigar Brands!"
        puts ""
        puts "\n#{@@cyn}Here you can find information on different cigar brands!#{@@white}\n"
        puts ""
        get_brand_results
        display_testbrand_results
        get_testuser_brand
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def get_brand_results
        @brands = CigarBrands::Brand.all  
    end

    def display_testbrand_results
        @brands.drop(2).each.with_index(1) do |brand, index|
            puts "#{index}. #{brand.name}"
        end
    end

    def get_testuser_brand
        puts "\n#{@@grn}Please choose a brand name from the list to see details about their different cigars."
        puts ""
        @chosen_brand = gets.strip.to_i  
        show_cigars_for(@chosen_brand) if valid_input(@chosen_brand, @brands)
    end

    def show_cigars_for(chosen_brand)
        brand = @brands[chosen_brand - 1]
        brand.get_cigars #scrape cigars_for_chosen_brand so a brand knows what cigars it has (i.e. has many rel)
        puts "\n#{@@cyn}Here are test cigar details for #{brand.name}#{@@white}\n" 
        brand.cigars.each do |cigar|
            puts ""
            puts "Cigar Name:   #{cigar.name}"
            puts "    Length:   #{cigar.length}"
            puts "Ring Gauge:   #{cigar.gauge}"
            puts "   Country:   #{cigar.country}"
            puts "   Filler:    #{cigar.filler}"
            puts "   Wrapper:   #{cigar.wrapper}"
            puts "   Color:     #{cigar.color}"
            puts "   Strength:  #{cigar.strength}"
            puts "   Rating:    #{cigar.rating}"
        end
        user_input
    end

    def user_input
        puts ""
        puts ""
        puts "\n#{@@grn}Above are your results.\n \nPlease type #{@@white}'back'#{@@grn} to select a new brand name or #{@@white}'exit'#{@@grn} to restart the programme.#{@@white}\n"
        puts""
        @user_input = gets.strip.downcase
        if @user_input.downcase == "back"
            call     
        elsif @user_input.downcase == "exit"
            exit
        else
            puts  "Invalid entry." 
            puts ""
            user_input
        end
    end
    
    def exit
        puts ""
        puts "\n#{@@cyn}Thank you for visiting!"
        puts ""
        puts "\n#{@@grn}Type #{@@white}'restart'#{@@grn} to restart the programme#{@@white}\n"
        puts""
        @user_input = gets.strip.downcase
        if @user_input.downcase == "restart"
            call     
        else
            puts  "Invalid entry." 
            puts ""
            user_input
        end
    end
end