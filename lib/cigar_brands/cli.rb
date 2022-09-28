
class CigarBrands::CLI 
    
    attr_accessor :page_number, :brand

    @@grn="\e[1;32m"
    @@white="\e[0m"

    def call
        puts ""
        puts "\n#{@@grn}Welcome to Cigar Brands!#{@@white}\n"
        puts ""
        puts "Here you can find information on different cigar brands!"
        puts ""
        # get_page_numbers
        # list_test_pages
        # list_page_numbers
        get_brand_results
        display_brand_results
        get_user_brand
        get_cigar_results
        # display_results(@page_number)
        # puts "\n#{@@grn}There are 51 brands available, to view them, please type "brands" or type "exit" to exit this programme#{@@white}\n" # list_brands
        # user_chooses_brand(number)
        # get_brand_details(number)
    end

    # def get_call_decision
    #     # user_input
        
    # end

    def get_page_numbers
        @pages = CigarBrands::Page.all 
        # binding.pry
    end

    def list_test_pages
        puts "tester page_number list"
        @pages.each.with_index(1) do |page, index|
            puts "#{index}. #{page.page_number}"
        end
        puts "tester page_number list end"
        binding.pry
    end

    def list_page_numbers
        loop do 
        puts "\n#{@@grn}Choose a page number between 1 and 72 to see a list of brands.#{@@white}\n"
        puts ""
        @page_number = gets.strip.to_i
        break if @page_number.between?(1,72)
        puts  "Invalid entry. Please type your chosen page number between 1 and 72."
        end
        # display_results(@page_number)
    end
    

    # def get_user_page_number
    #     chosen_page = gets.strip.to_i
    #     show_results_for(chosen_page) if valid_input(chosen_page, @page_numbers)
    # end

    def valid_input(input, data)
        input.to_i <= @brands.length && input.to_i > 0
    end

    # def show_results_for(chosen_page)
    #     page = @page_numbers[chosen_page + 1] #or should it be - 1?
    #     puts "Here are the results for page #{chosen_page}"
    #     display_results

    #     ## To implement
    #     # CigarBrands::CLI.all.each.with_index(1) do | brand |
    #     #   puts brand.name
    #     # end 
    #     # get_chosen_brand
    # end

    def get_brand_results
        # CigarBrands::Scraper.get_brand_details(@page_number)
        @brands = CigarBrands::Brand.all  
    end

    def display_brand_results
        puts "tester brand list"
        @brands.each.with_index(1) do |brand, index|
            puts "#{index}. #{brand.name}"
        end
        puts "tester brand list end"
    end

    def get_user_brand
        puts "test ask user to choose brand (note that 'advanced search' returns nil so we recommend you start from 2 onwards"
        chosen_brand = gets.strip.to_i  
        show_brand_for(chosen_brand) if valid_input(chosen_brand, @brands)
    end

    def show_brand_for(chosen_brand)
        brand = @brands[chosen_brand - 1]
        puts "Here are test brands for #{brand.name}"
    end

    def get_cigar_results
        # CigarBrands::Scraper.get_brand_details(@page_number)
        @cigars = CigarBrands::Cigar.all  
        puts "got test cigar results"
        binding.pry
    end


    def display_results(page_number)
        puts "Here are the results for page #{@page_number}"
        puts ""
        @results = CigarBrands::Scraper.show_page_results(@page_number)
        # puts ""
        # puts "Please type the brand name in to view cigars associated with the brand"
        # puts""
        # @brand = gets.strip.downcase
        # display_cigars(@brand) #possibly change brand to cigar?
        # user_input
    end

    def display_cigars(brand)
        puts ""
        puts "Please type the brand name in to view cigars associated with the brand"
        puts""
        @brand = gets.strip.downcase
        puts "Here are the results for brand name #{@brand}"
        puts ""
        @brand = CigarBrands::Scraper.show_brand_details(@brand)
        puts "Please type back to select a new brand name or exit to restart the programme"
        puts""
        user_input
    end


    def user_input
        @user_input = gets.strip.downcase

        if @user_input.downcase == "back"
            display_results(page_number)
        # elsif @user_input.downcase == "restart"
        #     list_page_numbers
        elsif @user_input.downcase == "exit"
            exit
        # elsif @user_input.to_i < @results.length && @user_input.to_i > 0
        #     show_results_for(brand)
        else
            puts  "Invalid entry." #"Please [select a number from the list to view cigars associated with the brand,] type brand to select a new page number or type exit to exit the programme"
            # display_result(@page_number)
        end
    end
    
    # def valid_input(user_input, data)
    #     @user.input.to_i <= @results.length && @user_input.to_i > 0
    # end

    def exit
        puts "Thank you for visiting!"
        call
    end
end



# class CigarBrands::CLI 
    
#     @@grn="\e[1;32m"
#     @@white="\e[0m"

#     def call
#         puts ""
#         puts "\n#{@@grn}Welcome to Cigar Brands!#{@@white}\n"
#         puts ""
#         puts "Here you can find information on different cigar brands!"
#         puts ""
#         list_page_numbers
#         get_user_page_results
#         display_results
#         # puts "\n#{@@grn}There are 51 brands available, to view them, please type "brands" or type "exit" to exit this programme#{@@white}\n" # list_brands
#         # user_chooses_brand(number)
#         # get_brand_details(number)
#     end

#     # def get_call_decision
#     #     # user_input
        
#     # end

#     # def get_page_numbers
#     #     @page_numbers = CigarBrands::Page.all 
#     # end

#     def list_page_numbers
#         loop do
#         # list results    
#         puts "\n#{@@grn}Choose a page number between 1 and 72 to see a list of brands.#{@@white}\n"
#         puts ""
#         @page_number = gets.strip.to_i
#         break if @page_number.to_i.between?(1,72)
#         puts  "Invalid entry. Please type your chosen page number between 1 and 72."
#         end
#         # display_results

#         # @page_numbers.each.with_index(1) do |page_number, index|
#         #     puts "#{index} #{page_number.number}"
#         # end
#     end

#     def get_user_page_number(@page_number)
#         chosen_page = @page_number
#         show_results_for(chosen_page) if valid_input(chosen_page, @page_number)
#     end

#     def valid_input(input, data)
#         input.to_i <= @page_number.length && input.to_i > 0
#     end

#     def show_results_for(chosen_page)
#         puts "Here are the results for page #{chosen_page}"
#         @page_numbers = CigarBrands::Page.all 

#         ## To implement
#         # CigarBrands::CLI.all.each.with_index(1) do | brand |
#         #   puts brand.name
#         # end 
#         # get_chosen_brand
#     end

#     def display_results
#         puts "Here are the results for page #{@page_numbers}"
#         @results = CigarBrands::Page.results 
#     end
# end