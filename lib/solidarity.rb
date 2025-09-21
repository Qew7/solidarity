# frozen_string_literal: true

require_relative "solidarity/version"
require_relative "solidarity/railroady_runner"
require_relative "solidarity/graph"
require_relative "solidarity/solid_evaluator"
require_relative "solidarity/reporter"

module Solidarity
  class Error < StandardError; end
end
