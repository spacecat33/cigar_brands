class CigarBrands::Cigar
    attr_accessor :name
    attr_reader :length, :gauge, :country
    
    @@all = []
   

    def initialize(name, length, gauge, country)
        @name = name
        @length = length
        @gauge = gauge
        @country = country
        # chosen_brand(brand)
        save
    end

    def self.all
        CigarBrands::Scraper.get_brandcigar_details(brand) if @@all.empty?
        @@all
    end

    def save
        @@all << self
    end

    # def chosen_brand(brand)
    #     @brand
    # end
end