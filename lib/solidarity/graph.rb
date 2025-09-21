require 'railroady/diagram_graph'

module Solidarity
  class Graph
    attr_reader :nodes, :edges

    def initialize(railroady_graph)
      @nodes = railroady_graph.nodes.map do |node_data|
        Node.new(name: node_data[1], label: node_data[1], type: node_data[0])
      end
      @edges = railroady_graph.edges.map do |edge_data|
        Edge.new(source: edge_data[1], target: edge_data[2], label: edge_data[3], type: edge_data[0])
      end
    end

    def find_node(name)
      @nodes.find { |node| node.name == name }
    end

    def outgoing_edges(node_name)
      @edges.select { |edge| edge.source == node_name }
    end

    def incoming_edges(node_name)
      @edges.select { |edge| edge.target == node_name }
    end

    class Node
      attr_reader :name, :label, :type

      def initialize(data)
        @name = data[:name]
        @label = data[:label]
        @type = data[:type]
      end
    end

    class Edge
      attr_reader :source, :target, :label, :type

      def initialize(data)
        @source = data[:source]
        @target = data[:target]
        @label = data[:label]
        @type = data[:type]
      end
    end
  end
end
