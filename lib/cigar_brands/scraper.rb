class CigarBrands::Scraper 
    def self.scrape_pages(page_number = 1)
        doc = Nokogiri::HTML(URI.open("http://www.cigargeeks.com/cigardb/default.asp?action=&page=#{page_number}"))
        CigarBrands::Page.new(@page_number)
    end

    # def self.show_page_results(page_number)
    #     doc = Nokogiri::HTML(URI.open("http://www.cigargeeks.com/cigardb/default.asp?action=&page=#{page_number}"))
    #     @results = doc.css(".bbstable a")

    #     @results.each.with_index(1) do |r, index|
    #         puts "#{index}. #{r.text.strip}"
    #     end
    # end

    def self.get_brand_details
        doc = Nokogiri::HTML(URI.open("http://www.cigargeeks.com/cigardb/default.asp?action=&page=1"))
        
        names = doc.css(".bbstable a") #bbstable tr td

        names.each do |n|
            name = n.text
            CigarBrands::Brand.new(name)
        end
    end

    def self.get_brandcigar_details
        doc = Nokogiri::HTML(URI.open("http://www.cigargeeks.com/cigardb/default.asp?action=&page=1"))
        
        names = doc.css(".bbstable tr td") 

        names.each do |n|
            name = n.text
            CigarBrands::Cigar.new(name)
        end
    end


    # def self.show_brand_details(brand)
    #     doc = Nokogiri::HTML(URI.open("http://www.cigargeeks.com/cigardb/default.asp?action=srchrslt&cigar_brand=#{@brand}"))
    #     @brand = doc.css(".bbstable tr td")

    #     @brand.each.with_index(1) do |b, index|
    #         puts "#{index}. #{b.text.strip}"
    #     end
    # end

end

# page_number = 72
# site = "http://www.cigargeeks.com/cigardb/default.asp?action=&page=#{page_number}"

# doc = Nokogiri::HTML(URI.open(site))

# results = doc.css('.bbstable a')

# # number of results on the chosen page e.g. 51 on page 1
# puts results.count

# results.each do |r|
#   puts r.text.strip
# end
# puts ''

# for brand's cigar details: doc.css('.bbstable tr')
# puts 'Finished loading'

