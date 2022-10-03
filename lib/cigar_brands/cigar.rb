class CigarBrands::Cigar
    attr_accessor :brand, :name, :length, :gauge, :country, :filler, :wrapper, :color, :strength, :rating
    
    @@all = []
   

    def initialize(brand, name, length, gauge, country, filler, wrapper, color, strength, rating)
        @brand = brand
        @name = name
        @length = length
        @gauge = gauge
        @country = country
        @filler = filler 
        @wrapper = wrapper
        @color = color
        @strength = strength
        @rating = rating
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