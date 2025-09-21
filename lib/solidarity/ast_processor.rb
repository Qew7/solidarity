# frozen_string_literal: true

require 'parser/current'

module Solidarity
  class AstProcessor
    attr_reader :classes, :modules, :inheritances, :includes

    def initialize
      @classes = []
      @modules = []
      @inheritances = [] # Format: [['ChildClass', 'ParentClass']]
      @includes = []     # Format: [['ClassOrModule', 'IncludedModule']]
    end

    def process_file(file_path)
      content = File.read(file_path)
      ast = Parser::CurrentRuby.parse(content)
      traverse_ast(ast, nil) # Pass initial context as nil
    end

    private

    def traverse_ast(node, current_context)
      return unless node.is_a?(Parser::AST::Node)

      new_context = current_context

      case node.type
      when :class
        class_name = extract_const_name(node.children[0])
        superclass_name = extract_const_name(node.children[1])
        @classes << class_name
        @inheritances << [class_name, superclass_name] if superclass_name
        new_context = class_name
      when :module
        module_name = extract_const_name(node.children[0])
        @modules << module_name
        new_context = module_name
      when :send
        if node.children[1] == :include
          included_module = extract_const_name(node.children[2])
          @includes << [current_context, included_module] if current_context && included_module
        end
      end

      node.children.each { |child| traverse_ast(child, new_context) }
    end

    def extract_const_name(node)
      return unless node.is_a?(Parser::AST::Node)

      case node.type
      when :const
        parent = extract_const_name(node.children[0])
        [parent, node.children[1]].compact.join('::')
      when :cbase
        '' # Absolute constant, e.g., ::MyClass
      else
        nil
      end
    end
  end
end
