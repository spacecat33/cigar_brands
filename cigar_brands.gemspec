# frozen_string_literal: true

require_relative "lib/cigar_brands/version"

Gem::Specification.new do |spec|
  spec.name = "cigar_brands"
  spec.version = CigarBrands::VERSION
  spec.authors = ["spacecat33"]
  spec.email = ["spacecat33"]

  spec.summary = "Helps find the cigars that different brands make."
  spec.description = "You choose a brand and then it will give you a list of that brand's cigars with some additional information about those cigars."
  spec.homepage = "https://github.com/spacecat33/cigar_brands"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "http://www.test/com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/spacecat33/cigar_brands"
  spec.metadata["changelog_uri"] = "http://www.test/com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_development_dependency "pry"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_dependency "nokogiri"
  spec.add_dependency "open-uri"


  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
