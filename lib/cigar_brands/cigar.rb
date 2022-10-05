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
        @@all
    end

    def add_to_brand 
        brand.cigars << self unless brand.cigars.include?(self) #self.brand.cigars
    end

    def save
        @@all << self
    end

end

# Side note re ruby methods:
# def trees  
#     tree = "oak"
#     if tree == "oak"
#        return "oak" # the return keyword stops execution of the method so would return oak. remoning return keyword, ruby would return the last line evaluated.
#     else 
#         "fir"
#     end
#     "pine"
# end

# found_tree = trees 
# puts found_tree