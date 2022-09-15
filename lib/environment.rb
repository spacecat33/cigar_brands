# frozen_string_literal: true

require_relative "cigar_brands/version"
require_relative "cigar_brands/cli.rb"
require_relative "cigar_brands/page.rb"
require_relative "cigar_brands/scraper.rb"

require "pry"
require "nokogiri"

module CigarBrands
  class Error < StandardError; end
  # Your code goes here...
end

