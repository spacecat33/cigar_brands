class CigarBrands::Page
    @@all = []

    attr_accessor :page_number

    def initialize(page_number = 1)
        @page_number = page_number
        save
    end

    def self.all
        CigarBrands::Scraper.scrape_pages(@page_number) if @@all.empty?
        @@all
    end

    def self.results
        CigarBrands::Scraper.show_page_results(@page_number)
    end

    def save
        @@all << self
    end
end