class CigarBrands::Brand
    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @cigars = [] # create a method here that expects cigar object and add it to this array because a brand has many cigars
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