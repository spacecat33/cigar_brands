class CigarBrands::Brand
    @@all = []

    attr_accessor :name, :cigars

    def initialize(name)
        @name = name
        @cigars = [] # create a method that expects cigar objects and add it to this array because a brand has many cigars
        save
    end
    
    def cigars
        CigarBrands::Cigar.all.select {|cigar| cigar.brand == self}
        @cigars << self
    end

    # def add_cigar(cigar)
    #     @cigars << cigar
    #     cigar.brand = self
    # end

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