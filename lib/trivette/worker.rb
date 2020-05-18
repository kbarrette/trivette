# frozen_string_literal: true

require 'active_support/inflector'
require 'sidekiq'

module Trivette
  # A Sidekiq worker that runs tasks in sequence
  class Worker
    include Sidekiq::Worker

    def perform(steps, *args)
      klass = ActiveSupport::Inflector.constantize(steps.first)
      klass.new.run(*args)

      return if steps.size <= 1

      klass.perform_async(steps[1..-1], *args)
    end
  end
end
