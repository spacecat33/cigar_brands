class CigarBrands::Cigar
    attr_accessor :brand, :name, :length, :gauge, :country
    
    @@all = []
   

    def initialize(brand, name, length, gauge, country)
        @brand = brand
        @name = name
        @length = length
        @gauge = gauge
        @country = country
        add_to_brand
        save
    end

    def self.all
        CigarBrands::Scraper.get_brandcigar_details(brand) if @@all.empty?
        @@all
    end

    def add_to_brand 
        @brand.cigars << self unless @brand.cigars.include?(self)
    end

    def save
        @@all << self
    end

end