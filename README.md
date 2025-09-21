# Solidarity

A Ruby gem for analyzing Ruby projects for SOLID principles adherence. This gem uses RailRoady to generate class diagrams and then analyzes them to provide an assessment of SOLID principles.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'solidarity'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install solidarity

## Usage

To analyze a Ruby project, run the `solidarity` executable with the path to your project's root directory:

    $ solidarity /path/to/your/ruby/project

The gem will generate a report similar to the following:

```
# Ruby SOLID Principles Analysis Report

## SRP - Single Responsibility Principle
Score: 80.00/100
Details: {"MyClass"=>80, "AnotherClass"=>90}

## OCP - Open/Closed Principle
Score: 75.00/100
Details: Number of inheritance/inclusion relationships: 5

## LSP - Liskov Substitution Principle
Score: 70.00/100
Details: LSP is difficult to assess statically from a dependency graph.

## ISP - Interface Segregation Principle
Score: 70.00/100
Details: ISP is difficult to assess without method-level dependency analysis.

## DIP - Dependency Inversion Principle
Score: 100.00/100
Details: DIP assessment requires distinguishing abstract from concrete classes.
```

(Note: The scores and details in the example report are illustrative and will vary based on your project's structure.)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/solidarity. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://contributor-covenant.org/version/2/1/code_of_conduct/) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Solidarity project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/solidarity/blob/main/CODE_OF_CONDUCT.md).
