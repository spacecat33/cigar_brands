class CigarBrands::Page
    @@all = []

    attr_accessor :number

    def initialize(number = 1)
        @number = number
        save
    end

    def self.all
        CigarBrands::Scraper.scrape_pages(page_number = @number) if @@all.empty?
        @@all
    end

    def self.results
        CigarBrands::Scraper.show_page_results(page_number = @number)
    end

    def save
        @@all << self
    end
end