# frozen_string_literal: true

require "sidekiq/testing"
Sidekiq::Testing.inline!

RSpec.describe Trivette do
  describe ".execute" do
    it "runs the steps in order" do
      expect_any_instance_of(Trivette::TestStepOne)
        .to receive(:execute)
        .with("other args")
        .once
      expect_any_instance_of(Trivette::TestStepTwo)
        .to receive(:execute)
        .with("other args")
        .once
      expect_any_instance_of(Trivette::TestStepThree)
        .to receive(:execute)
        .with("other args")
        .once

      Trivette.execute(
        [
          Trivette::TestStepOne,
          Trivette::TestStepTwo,
          Trivette::TestStepThree
        ],
        "other args"
      )
    end
  end
end
