# frozen_string_literal: true

require 'sidekiq/testing'
Sidekiq::Testing.inline!

RSpec.describe Trivette do
  describe '.run_async' do
    it 'runs the steps in order' do
      expect_any_instance_of(Trivette::TestStepOne)
        .to receive(:run)
        .with('other args')
        .once
      expect_any_instance_of(Trivette::TestStepTwo)
        .to receive(:run)
        .with('other args')
        .once
      expect_any_instance_of(Trivette::TestStepThree)
        .to receive(:run)
        .with('other args')
        .once

      Trivette.run(
        [
          Trivette::TestStepOne,
          Trivette::TestStepTwo,
          Trivette::TestStepThree
        ],
        'other args'
      )
    end
  end
end
