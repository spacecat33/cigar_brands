class CigarBrands::Cigar
    attr_accessor :name
    attr_reader :length, :gauge, :country
    
    @@all = []
   

    def initialize(name, length, gauge, country)
        @name = name
        @length = length
        @gauge = gauge
        @country = country
        save
    end

    def self.all
        # CigarBrands::Scraper.get_brandcigar_details if @@all.empty?
        @@all
    end

    def save
        @@all << self
    end
end