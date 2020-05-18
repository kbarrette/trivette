# frozen_string_literal: true

require 'trivette/version'
require 'trivette/worker'

# Main entry points
module Trivette
  def self.run(steps, *args)
    Worker.perform_async(
      steps.map(&:to_s),
      *args
    )
  end
end
