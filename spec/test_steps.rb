# frozen_string_literal: true

module Trivette
  class TestStep < Trivette::Worker
    def run(*args)
    end
  end

  TestStepOne = Class.new(TestStep)
  TestStepTwo = Class.new(TestStep)
  TestStepThree = Class.new(TestStep)
end
