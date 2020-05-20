# frozen_string_literal: true

module Trivette
  class TestStep
    include Trivette::Worker

    def execute(*args)
    end
  end

  TestStepOne = Class.new(TestStep)
  TestStepTwo = Class.new(TestStep)
  TestStepThree = Class.new(TestStep)
end
