require 'fileutils'
require 'parser/current'
require_relative 'ast_processor' # Add this line

module Solidarity
  class RailRoadyRunner
    def self.run(project_path)
      unless File.directory?(project_path)
        raise ArgumentError, "Project path '#{project_path}' is not a valid directory."
      end

      # Remove Railroady's Rails-specific environment loading
      # options = OptionsStruct.new(root: project_path, verbose: false, output: nil)
      # diagram = ModelsDiagram.new(options)
      # diagram.process
      # diagram.generate
      # diagram.graph

      ruby_files = Dir.glob(File.join(project_path, "**", "*.rb"))
      ast_data = process_ruby_files_with_ast(ruby_files)
      Solidarity::Graph.from_ast_data(ast_data)
    end

    private

    def self.process_ruby_files_with_ast(ruby_files)
      processor = AstProcessor.new
      ruby_files.each do |file_path|
        processor.process_file(file_path)
      end
      { classes: processor.classes, modules: processor.modules, inheritances: processor.inheritances, includes: processor.includes }
    end

    def self.add_nodes_from_ast(graph, ast_data)
      ast_data[:classes].each do |class_name|
        graph.add_node(['class', class_name])
      end
      ast_data[:modules].each do |module_name|
        graph.add_node(['module', module_name])
      end
    end

    def self.add_edges_from_ast(graph, ast_data)
      ast_data[:inheritances].each do |child, parent|
        graph.add_edge(['is-a', parent, child]) unless parent.empty? # Railroady expects parent then child for 'is-a'
      end
      ast_data[:includes].each do |includer, included|
        graph.add_edge(['includes', includer, included])
      end
    end
  end
end
