class CigarBrands::Page
    @@all = []

    attr_accessor :number

    def initialize(number)
        @number = number
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end
end