# frozen_string_literal: true

RSpec.describe Trivette::Worker do
  describe "#perform(steps, *args)" do
    it "passes all args to the step" do
      expect_any_instance_of(Trivette::TestStep)
        .to receive(:execute)
        .with(1, "two", 3)

      Trivette::TestStep.new.perform([Trivette::TestStep.to_s], 1, "two", 3)
    end
  end
end
