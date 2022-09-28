class CigarBrands::Brand
    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        save
    end

    def self.all
        CigarBrands::Scraper.get_brand_details if @@all.empty?
        @@all
    end

    # def self.results
    #     CigarBrands::Scraper.show_page_results(@page_number)
    # end

    def save
        @@all << self
    end
end