module Solidarity
  class SolidEvaluator
    def initialize(graph)
      @graph = graph
    end

    def evaluate_srp
      # Single Responsibility Principle (SRP)
      # Heuristic: High outgoing edges might indicate multiple responsibilities.
      # For a more accurate measure, we'd need to analyze method calls/dependencies within each class.
      srp_scores = {}
      @graph.nodes.each do |node|
        outgoing_count = @graph.outgoing_edges(node.name).count
        srp_scores[node.name] = outgoing_count < 5 ? 100 : (100 - (outgoing_count - 5) * 10).clamp(0, 100)
      end
      { score: srp_scores.values.sum / srp_scores.size.to_f, details: srp_scores }
    end

    def evaluate_ocp
      # Open/Closed Principle (OCP)
      # Heuristic: Presence of inheritance/module inclusions. Hard to measure purely from dependency graph.
      # A higher number of classes participating in inheritance/module inclusion might suggest better OCP.
      ocp_score = 0
      inheriting_nodes = @graph.edges.count { |edge| edge.type == :inheritance || edge.type == :includes }
      ocp_score = (inheriting_nodes > @graph.nodes.count / 4) ? 100 : (inheriting_nodes * 100.0 / (@graph.nodes.count / 4)).clamp(0, 100)
      { score: ocp_score, details: "Number of inheritance/inclusion relationships: #{inheriting_nodes}" }
    end

    def evaluate_lsp
      # Liskov Substitution Principle (LSP)
      # Very hard to evaluate statically from a dependency graph. Requires behavioral analysis.
      # Placeholder: Assume a perfectly flat hierarchy (no deep inheritance) is better, but this is a very weak heuristic.
      { score: 70, details: "LSP is difficult to assess statically from a dependency graph." }
    end

    def evaluate_isp
      # Interface Segregation Principle (ISP)
      # Heuristic: Could look for modules included by many classes but with few used methods by each class.
      # Requires method-level analysis, which is not available from railroady's DOT output.
      { score: 70, details: "ISP is difficult to assess without method-level dependency analysis." }
    end

    def evaluate_dip
      # Dependency Inversion Principle (DIP)
      # Heuristic: High-level modules should depend on abstractions, not concretions.
      # We can look for dependencies from concrete classes to other concrete classes as a potential violation.
      # This requires distinguishing between abstract/concrete classes, which railroady doesn't explicitly provide.
      dip_score = 100
      # For now, a very simplistic view: count edges between concrete classes.
      # This needs significant refinement to be meaningful.
      # concrete_to_concrete_dependencies = 0 # Placeholder
      # @graph.edges.each do |edge|
      #   source_node = @graph.find_node(edge.source)
      #   target_node = @graph.find_node(edge.target)
      #   if source_node&.type == :class && target_node&.type == :class # Assuming :class is concrete
      #     concrete_to_concrete_dependencies += 1
      #   end
      # end
      # dip_score = (100 - concrete_to_concrete_dependencies * 5).clamp(0, 100)

      { score: dip_score, details: "DIP assessment requires distinguishing abstract from concrete classes." }
    end

    def evaluate_all
      { 
        srp: evaluate_srp,
        ocp: evaluate_ocp,
        lsp: evaluate_lsp,
        isp: evaluate_isp,
        dip: evaluate_dip
      }
    end
  end
end
