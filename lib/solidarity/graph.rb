require 'railroady/diagram_graph'

module Solidarity
  class Graph
    attr_reader :nodes, :edges

    def initialize(data_source)
      @nodes = []
      @edges = []

      if data_source.is_a?(Hash) && data_source.key?(:classes)
        # Data from AST Processor
        initialize_from_ast_data(data_source)
      else
        # Original Railroady graph data
        initialize_from_railroady_graph(data_source)
      end
    end

    def self.from_ast_data(ast_data)
      new(ast_data)
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

    private

    def initialize_from_railroady_graph(railroady_graph)
      @nodes = railroady_graph.nodes.map do |node_data|
        Node.new(name: node_data[1], label: node_data[1], type: node_data[0])
      end
      @edges = railroady_graph.edges.map do |edge_data|
        Edge.new(source: edge_data[1], target: edge_data[2], label: edge_data[3], type: edge_data[0])
      end
    end

    def initialize_from_ast_data(ast_data)
      ast_data[:classes].each do |class_name|
        @nodes << Node.new(name: class_name, label: class_name, type: 'class')
      end
      ast_data[:modules].each do |module_name|
        @nodes << Node.new(name: module_name, label: module_name, type: 'module')
      end

      ast_data[:inheritances].each do |child, parent|
        @edges << Edge.new(source: parent, target: child, label: '', type: 'is-a')
      end

      ast_data[:includes].each do |includer, included|
        @edges << Edge.new(source: includer, target: included, label: '', type: 'includes')
      end
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
