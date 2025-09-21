module Solidarity
  class Reporter
    def self.generate_report(solid_results)
      report = "# Ruby SOLID Principles Analysis Report\n\n"

      solid_results.each do |principle, result|
        report += "## #{principle.to_s.upcase} - #{full_principle_name(principle)}\n"
        report += "Score: #{result[:score].round(2)}/100\n"
        report += "Details: #{result[:details]}\n\n"
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
