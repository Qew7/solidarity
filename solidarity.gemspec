# frozen_string_literal: true

require_relative "lib/solidarity/version"

Gem::Specification.new do |spec|
  spec.name = "solidarity"
  spec.version = Solidarity::VERSION
  spec.authors = ["Your Name"]
  spec.email = ["your_email@example.com"]

  spec.summary = %q{A Ruby gem for analyzing Ruby projects for SOLID principles adherence.}
  spec.description = %q{This gem uses RailRoady to generate class diagrams and then analyzes them to provide an assessment of SOLID principles.}
  spec.homepage = "https://github.com/solidarity-gem/solidarity"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` command returns everything that isn't ignored by git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\0") }
  spec.files = files.grep(%r{\A(?:exe|lib|sig)/}) { |f| File.basename(f) == "solidarity.rbs" ? f : File.join(File.dirname(f), File.basename(f)) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "parser", "~> 3.3.0.2"

  spec.add_development_dependency "minitest", "~> 5.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["allowed_push_host"] = "https://rubygems.org" # Optional: To prevent accidental pushes to other hosts
  spec.metadata["homepage_uri"] = "https://github.com/solidarity-gem/solidarity"
  spec.metadata["source_code_uri"] = "https://github.com/solidarity-gem/solidarity"
  spec.metadata["changelog_uri"] = "https://github.com/solidarity-gem/solidarity/blob/main/CHANGELOG.md"
end
