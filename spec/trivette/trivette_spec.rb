# frozen_string_literal: true

RSpec.describe Trivette do
  describe '.run_async' do
    it 'passes the steps to the worker' do
      expect(Trivette::Worker)
        .to receive(:perform_async)
        .with(
          %w[
            Trivette::TestStepOne
            Trivette::TestStepTwo
            Trivette::TestStepThree
          ],
          'other args'
        )

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
