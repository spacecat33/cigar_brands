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
        # puts "\n#{@@grn}There are 51 brands available, to view them, please type "brands" or type "exit" to exit this programme#{@@white}\n" # list_brands
        # user_chooses_brand(number)
        # get_brand_details(number)
    end

    # def get_call_decision
    #     # user_input
        
    # end

    def get_page_numbers
        # to be scraped instead
        @page_numbers = [7, 8, 9]
    end

    def list_page_numbers
        # list results    
        puts "\n#{@@grn}Choose a page number to see a list of brands.#{@@white}\n"
        puts ""
        @page_numbers.each.with_index(1) do |page_number, index|
            puts "#{index} #{page_number}"
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
        puts "Here are the results for #{page}"
        binding.pry
    end
end