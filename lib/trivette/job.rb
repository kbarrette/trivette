# frozen_string_literal: true

module Trivette
  # The initial job enqueued by Trivette.run
  class Job
    include Trivette::Worker
  end
end
