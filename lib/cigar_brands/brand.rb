class CigarBrands::Brand
    @@all = []

    attr_accessor :name, :cigars

    def initialize(name)
        @name = name
        @cigars = [] # a method that expects cigar objects and add it to this array because a brand has many cigars
        save
    end

    def self.all
        CigarBrands::Scraper.get_brand_details if @@all.empty?
        @@all
    end

    def get_cigars  
        CigarBrands::Scraper.get_brandcigar_details(self) if @cigars.empty?
    end

    def save
        @@all << self
    end
end