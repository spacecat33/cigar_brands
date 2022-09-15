class CigarBrands::Scraper 
    def scrape_pages(page_number = 1)
        doc = Nokogiri::HTML(open(http://www.cigargeeks.com/cigardb/default.asp?action=&page=#{page_number}))
        binding.pry
    end
end

# page_number = 72
# site = "http://www.cigargeeks.com/cigardb/default.asp?action=&page=#{page_number}"

# page = Nokogiri::HTML(URI.open(site))

# results = page.css('.bbstable a')

# # number of results on the chosen page e.g. 51 on page 1
# puts results.count

# results.each do |r|
#   puts r.text.strip
# end
# puts ''
# puts 'Finished loading'