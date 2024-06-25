require "rails_helper"
# rubocop:disable RSpec/MultipleMemoizedHelpers
describe Listings::UpdatedAt do
  subject { described_class.call(listing:) }

  let(:listing) { build_stubbed(:listing, applications:, updated_at: listing_updated_at) }
  let(:applications) do
    [
      build_stubbed(:application, replies: [], updated_at: 1.year.ago),
      build_stubbed(:application, replies:, updated_at: application_updated_at)
    ]
  end
  let(:replies) do
    [
      build_stubbed(:reply, updated_at: 1.year.ago),
      build_stubbed(:reply, updated_at: reply_updated_at)
    ]
  end
  let(:listing_updated_at) { 1.year.ago }
  let(:application_updated_at) { 1.year.ago }
  let(:reply_updated_at) { 1.year.ago }

  context "when listing has latest updated_at" do
    let(:listing_updated_at) { 1.day.ago }

    it "returns listing updated_at" do
      expect(subject).to eq(listing_updated_at)
    end
  end

  context "when application has latest updated_at" do
    let(:application_updated_at) { 1.day.ago }

    it "returns application updated_at" do
      expect(subject).to eq(application_updated_at)
    end
  end

  context "when reply has latest updated_at" do
    let(:reply_updated_at) { 1.day.ago }

    it "returns reply updated_at" do
      expect(subject).to eq(reply_updated_at)
    end
  end
end
# rubocop:enable RSpec/MultipleMemoizedHelpers
