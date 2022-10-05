class CigarBrands::Scraper 

    def self.get_brand_details
        doc = Nokogiri::HTML(URI.open("http://www.cigargeeks.com/cigardb/default.asp?action=&page=1"))
        
        names = doc.css(".bbstable a") #bbstable tr td

        names.each do |n| #can change to names.drop(2).each do |n| - to validate here before its stored and not in cli
            name = n.text
            CigarBrands::Brand.new(name)
        end
    end

    def self.get_brandcigar_details(brand) #pass in brand_object here
        doc = Nokogiri::HTML(URI.open("http://www.cigargeeks.com/cigardb/default.asp?action=srchrslt&cigar_brand=#{brand.name.gsub(" ", "+")}"))

        
           cigars = doc.css(".bbstable tr")
            cigars.drop(2).each do |c|
                name = c.css("td:nth-child(1)").text
                length = c.css("td:nth-child(2)").text
                gauge = c.css("td:nth-child(3)").text
                country = c.css("td:nth-child(4)").text
                filler = c.css("td:nth-child(5)").text
                wrapper = c.css("td:nth-child(6)").text
                color = c.css("td:nth-child(7)").text
                strength = c.css("td:nth-child(8)").text
                rating = c.css("td:nth-child(9)").text
            CigarBrands::Cigar.new(brand, name, length, gauge, country, filler, wrapper, color, strength, rating) #add brand object to cigar array - note that n.css("td:nth-child(1)").text = the different columns
        end
        # @cigars
    end

end
