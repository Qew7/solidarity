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

### Command-Line Options

`solidarity` supports the following command-line options:

*   **`--with-specs`**
    *   **Description:** By default, `solidarity` excludes files located in `test/` or `spec/` directories, as well as files ending with `_test.rb` or `_spec.rb`. Use this option to include these files in the analysis.
    *   **Example:**
        ```bash
        solidarity --with-specs /path/to/your/ruby/project
        ```

*   **`--with-srp-details`**
    *   **Description:** When generating the report for the Single Responsibility Principle (SRP), this option includes a detailed breakdown of SRP scores per class. Without this option, only the overall SRP score is displayed.
    *   **Example:**
        ```bash
        solidarity --with-srp-details /path/to/your/ruby/project
        ```

    You can also combine options:

    ```bash
    solidarity --with-specs --with-srp-details /path/to/your/ruby/project
    ```

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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Qew7/solidarity. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://contributor-covenant.org/version/2/1/code_of_conduct/) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
