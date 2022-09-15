
class CigarBrands::CLI 
    
    attr_accessor :page_number

    @@grn="\e[1;32m"
    @@white="\e[0m"

    def call
        puts ""
        puts "\n#{@@grn}Welcome to Cigar Brands!#{@@white}\n"
        puts ""
        puts "Here you can find information on different cigar brands!"
        puts ""
        # get_page_numbers
        list_page_numbers
        display_results(@page_number)
        # puts "\n#{@@grn}There are 51 brands available, to view them, please type "brands" or type "exit" to exit this programme#{@@white}\n" # list_brands
        # user_chooses_brand(number)
        # get_brand_details(number)
    end

    # def get_call_decision
    #     # user_input
        
    # end

    # def get_page_numbers
    #     @page_number = CigarBrands::Page.all 
    # end

    def list_page_numbers
        loop do 
        puts "\n#{@@grn}Choose a page number between 1 and 72 to see a list of brands.#{@@white}\n"
        puts ""
        @page_number = gets.strip.to_i
        break if @page_number.between?(1,72)
        puts  "Invalid entry. Please type your chosen page number between 1 and 72."
        end
    end
    

    # def get_user_page_number
    #     chosen_page = gets.strip.to_i
    #     show_results_for(chosen_page) if valid_input(chosen_page, @page_numbers)
    # end

    # def valid_input(input, data)
    #     input.to_i <= @page_numbers.length && input.to_i > 0
    # end

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

    def display_results(page_number)
        puts "Here are the results for page #{@page_number}"
        puts ""
        @results = CigarBrands::Scraper.show_page_results(@page_number)
        puts ""
        puts "Please select a number from the list above to view cigars associated with the brand or type exit to select a new page number"
        puts""
        # user_input
    end

    # def user_input
    # @user_input = = gets.strip.downcase

    # if @user_input == "exit"
    #     list_page_numbers
    # elsif @user_input == gets.strip.to_i


    # end


    # def exit
    # end
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