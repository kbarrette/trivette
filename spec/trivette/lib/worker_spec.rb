# frozen_string_literal: true

require 'sidekiq/testing'
Sidekiq::Testing.inline!

RSpec.describe Trivette::Worker do
  describe '#perform(steps, *args)' do
    it 'passes all args to the step' do
      expect_any_instance_of(Trivette::TestStep)
        .to receive(:run)
        .with(1, 'two', 3)

      Trivette::Worker.perform_async([Trivette::TestStep], 1, 'two', 3)
    end

    it 'performs the steps in order' do
      expect_any_instance_of(Trivette::TestStepOne)
        .to receive(:run)
        .once
      expect_any_instance_of(Trivette::TestStepTwo)
        .to receive(:run)
        .once
      expect_any_instance_of(Trivette::TestStepThree)
        .to receive(:run)
        .once

      Trivette::Worker.perform_async(
        [
          Trivette::TestStepOne,
          Trivette::TestStepTwo,
          Trivette::TestStepThree
        ]
      )
    end
  end
end
