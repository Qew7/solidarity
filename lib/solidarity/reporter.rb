module Solidarity
  class Reporter
    def self.generate_report(solid_results, with_srp_details: false)
      report = "# Ruby SOLID Principles Analysis Report\n\n"

      solid_results.each do |principle, result|
        report += "## #{principle.to_s.upcase} - #{full_principle_name(principle)}\n"
        report += "Score: #{result[:score].round(2)}/100\n"
        if principle == :srp && with_srp_details
          report += "Details:\n"
          result[:details].each do |class_name, score|
            report += "  - #{class_name}: #{score}/100\n"
          end
        elsif principle == :srp && !with_srp_details
          report += "Details: Omitted for brevity. Use --with-srp-details to see per-class scores.\n"
        else
          report += "Details: #{result[:details]}\n"
        end
        report += "\n"
      end

      report
    end

    private

    def self.full_principle_name(principle_symbol)
      case principle_symbol
      when :srp then "Single Responsibility Principle"
      when :ocp then "Open/Closed Principle"
      when :lsp then "Liskov Substitution Principle"
      when :isp then "Interface Segregation Principle"
      when :dip then "Dependency Inversion Principle"
      else "Unknown Principle"
      end
    end
  end
end
