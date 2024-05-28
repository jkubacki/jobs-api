require "rails_helper"

RSpec.describe Applications::Rejected do
  subject { described_class.call(application:) }

  let(:application) do
    build_stubbed(:application, replies:)
  end

  context "without replies" do
    let(:replies) { [] }

    it { is_expected.to eq false }
  end

  context "with any reply rejected" do
    let(:replies) do
      [build_stubbed(:reply, rejected: false), build_stubbed(:reply, rejected: true)]
    end

    it { is_expected.to eq true }
  end

  context "without rejected replies" do
    let(:replies) do
      [build_stubbed(:reply, rejected: false), build_stubbed(:reply, rejected: false)]
    end

    it { is_expected.to eq false }
  end
end
