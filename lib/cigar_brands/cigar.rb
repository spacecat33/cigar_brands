class CigarBrands::Cigar
    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        save
    end

    def self.all
        CigarBrands::Scraper.get_brandcigar_details if @@all.empty?
        @@all
    end


    def save
        @@all << self
    end
end