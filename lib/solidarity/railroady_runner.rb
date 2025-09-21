require 'fileutils'
require 'railroady'

module Solidarity
  class RailroadyRunner
    def self.run(project_path)
      unless File.directory?(project_path)
        raise ArgumentError, "Project path '#{project_path}' is not a valid directory."
      end

      options = Railroady::OptionsStruct.new(root: project_path, verbose: false, output: nil)

      diagram = Railroady::ModelsDiagram.new(options)

      diagram.process
      diagram.generate

      diagram.graph
    end
  end
end
