
class CigarBrands::CLI 
    
    # @@pages = ["1", "2", "3", "4", "5"]

    @@grn="\e[1;32m"
    @@white="\e[0m"
    @@blu="\e[1;34m"
    @@cyn="\e[1;36m"



    def call
        puts ""
        puts "\n#{@@grn}Welcome to Cigar Brands!#{@@white}\n"
        puts ""
        puts "Here you can find information on different cigar brands!"
        puts ""
        get_testbrand_results
        display_testbrand_results
        get_testuser_brand
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def get_testbrand_results
        @brands = CigarBrands::Brand.all  
    end

    def display_testbrand_results
        puts "\n#{@@blu}tester brand list"
        @brands.each.with_index(1) do |brand, index|
            puts "#{index}. #{brand.name}"
        end
        puts "tester brand list end"
    end

    def get_testuser_brand
        puts "\n#{@@grn}test - ask user to choose a brand name from the list for cigar information (note that 'advanced search' returns nil so we recommend you start from 2 onwards"
        @chosen_brand = gets.strip.to_i  
        show_cigars_for(@chosen_brand) if valid_input(@chosen_brand, @brands)
    end

    def show_cigars_for(chosen_brand)
        brand = @brands[chosen_brand - 1]
        brand.get_cigars #scrape cigars_for_chosen_brand
        puts "\n#{@@blu}Here are test cigar details for #{brand.name}" 
        brand.cigars.each do |cigar|
            puts ""
            puts "Cigar Name:   #{cigar.name}"
            puts "Length:  #{cigar.length}"
            puts "Ring Gauge:  #{cigar.gauge}"
            puts "Country:  #{cigar.country}"
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