# frozen_string_literal: true

require "trivette/version"
require "trivette/worker"

require "trivette/job"

# Main entry points
module Trivette
  def self.run(steps, *args)
    Trivette::Job.perform_async(
      steps.map(&:to_s),
      *args
    )
  end
end
