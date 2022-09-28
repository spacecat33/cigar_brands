class CigarBrands::Cigar
    attr_accessor :name, :more
    
    @@all = []
   

    def initialize(name)
        @name = name
        @more = []
        save
    end

    def self.all
        CigarBrands::Scraper.get_brandcigar_details if @@all.empty?
        @@all
    end

    def get_more  
        CigarBrands::Scraper.get_cigarmore(self) if @more.empty?
    end

    def save
        @@all << self
    end
end