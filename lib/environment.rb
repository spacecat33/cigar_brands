# frozen_string_literal: true

require_relative "cigar_brands/version"
require_relative "cigar_brands/cli.rb"
require_relative "cigar_brands/scraper.rb"
require_relative "cigar_brands/brand.rb"
require_relative "cigar_brands/cigar.rb"
require_relative "cigar_brands/more.rb"


require "pry"
require "nokogiri"
require "open-uri"

module CigarBrands
  class Error < StandardError; end
  # Your code goes here...
end

