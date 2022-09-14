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
        show_page_results
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

    def show_page_results
        # list results    
        @page_numbers.each.with_index { |page_number, index|
            puts "#{index + 1} #{page_number}"
    }
    end
end