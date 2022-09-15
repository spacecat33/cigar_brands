class CigarBrands::CLI 
    
    @@grn="\e[1;32m"
    @@white="\e[0m"

    def call
        puts ""
        puts "\n#{@@grn}Welcome to Cigar Brands!#{@@white}\n"
        puts ""
        puts "Here you can find information on different cigar brands!"
        puts ""
        get_page_numbers
        list_page_numbers
        get_user_page_number
        display_results
        # puts "\n#{@@grn}There are 51 brands available, to view them, please type "brands" or type "exit" to exit this programme#{@@white}\n" # list_brands
        # user_chooses_brand(number)
        # get_brand_details(number)
    end

    # def get_call_decision
    #     # user_input
        
    # end

    def get_page_numbers
        @page_numbers = CigarBrands::Page.all 
    end

    def list_page_numbers
        # list results    
        puts "\n#{@@grn}Choose a page number to see a list of brands.#{@@white}\n"
        puts ""
        @page_numbers.each.with_index(1) do |page_number, index|
            puts "#{index} #{page_number.number}"
        end
    end

    def get_user_page_number
        chosen_page = gets.strip.to_i
        show_results_for(chosen_page) if valid_input(chosen_page, @page_numbers)
    end

    def valid_input(input, data)
        input.to_i <= @page_numbers.length && input.to_i > 0
    end

    def show_results_for(chosen_page)
        page = @page_numbers[chosen_page + 1] #or should it be - 1?
        puts "Here are the results for page #{chosen_page}"
        display_results

        ## To implement
        # CigarBrands::CLI.all.each.with_index(1) do | brand |
        #   puts brand.name
        # end 
        # get_chosen_brand
    end

    def display_results
        @results = CigarBrands::Page.results 
    end
end