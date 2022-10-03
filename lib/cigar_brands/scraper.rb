class CigarBrands::Scraper 

    def self.get_brand_details
        doc = Nokogiri::HTML(URI.open("http://www.cigargeeks.com/cigardb/default.asp?action=&page=1"))
        
        names = doc.css(".bbstable a") #bbstable tr td

        names.each do |n|
            name = n.text
            CigarBrands::Brand.new(name)
        end
    end

    def self.get_brandcigar_details(brand) #pass in brand_object here
        doc = Nokogiri::HTML(URI.open("http://www.cigargeeks.com/cigardb/default.asp?action=srchrslt&cigar_brand=#{brand.name.gsub(" ", "+")}"))

        
           cigars = doc.css(".bbstable tr")
            cigars.drop(2).each do |n|
                name = n.css("td:nth-child(1)").text
                length = n.css("td:nth-child(2)").text
                gauge = n.css("td:nth-child(3)").text
                country = n.css("td:nth-child(4)").text
            CigarBrands::Cigar.new(brand, name, length, gauge, country) #add brand object to cigar array - note that n.css("td:nth-child(1)").text = the different columns
        end
        # @cigars
    end

end
