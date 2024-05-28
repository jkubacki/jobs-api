require "rails_helper"

RSpec.describe Listings::Rejected do
  subject { described_class.call(listing:) }

  let(:listing) do
    build_stubbed(:listing, applications:)
  end

  context "without applications" do
    let(:applications) { [] }

    it { is_expected.to eq false }
  end

  context "with applications" do
    let(:applications) { [first_application, second_application] }
    let(:first_application) { build_stubbed(:application) }
    let(:second_application) { build_stubbed(:application) }

    before do
      allow(Applications::Rejected).to(
        receive(:call).with(application: first_application).and_return(first_rejected)
      )
      allow(Applications::Rejected).to(
        receive(:call).with(application: second_application).and_return(second_rejected)
      )
    end

    context "with none applications rejected" do # rubocop:disable RSpec/MultipleMemoizedHelpers
      let(:first_rejected) { false }
      let(:second_rejected) { false }

      it { is_expected.to eq false }
    end

    context "with some application rejected" do # rubocop:disable RSpec/MultipleMemoizedHelpers
      let(:first_rejected) { false }
      let(:second_rejected) { true }

      it { is_expected.to eq false }
    end

    context "with all application rejected" do # rubocop:disable RSpec/MultipleMemoizedHelpers
      let(:first_rejected) { true }
      let(:second_rejected) { true }

      it { is_expected.to eq true }
    end
  end
end
