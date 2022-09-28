class CigarBrands::More
    attr_accessor :name, :cigar, :review
    
    @@all = []
   

    def initialize(name, cigar)
        @name = name
        @cigar = cigar
        add_to_more
        # notify cigar class about the more objects
        
        # @review = review
        save
    end

    def add_to_more
        @cigar.more << self unless @cigar.more.include?(self)
    end

    def self.all
        @@all
    end


    def save
        @@all << self
    end
end