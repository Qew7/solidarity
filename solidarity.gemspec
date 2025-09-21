# frozen_string_literal: true

require_relative "lib/solidarity/version"

Gem::Specification.new do |spec|
  spec.name = "solidarity"
  spec.version = Solidarity::VERSION
  spec.authors = ["Your Name"]
  spec.email = ["your_email@example.com"]

  spec.summary = %q{A Ruby gem for analyzing Ruby projects for SOLID principles adherence.}
  spec.description = %q{This gem uses Railroady to generate class diagrams and then analyzes them to provide an assessment of SOLID principles.}
  spec.homepage = "https://github.com/your-username/ruby-solid-analyzer"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` command is required to ensure that no extraneous files are added.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{^(test|spec|features)/}) || f.match(%r{^bin/(console|setup)$})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "railroady"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["allowed_push_host"] = "https://rubygems.org" # Optional: To prevent accidental pushes to other hosts
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/your-username/ruby-solid-analyzer"
  spec.metadata["changelog_uri"] = "https://github.com/your-username/ruby-solid-analyzer/blob/main/CHANGELOG.md"
end
