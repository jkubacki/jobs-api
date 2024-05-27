require "rails_helper"

RSpec.describe Seeds::NoRecentActivity do
  subject { described_class.call(since: 1.day.ago) }

  context "when there is a listing updated recently" do
    before do
      listing = create(:listing, updated_at: 1.minute.ago)
      create(:application, updated_at: 1.year.ago, listing:)
    end

    it { is_expected.to eq false }
  end

  context "when there is an application updated recently" do
    before do
      listing = create(:listing, updated_at: 1.year.ago)
      create(:application, updated_at: 1.minute.ago, listing:)
    end

    it { is_expected.to eq false }
  end

  context "when there is no listing or application updated recently" do
    before do
      listing = create(:listing, updated_at: 1.year.ago)
      create(:application, updated_at: 1.year.ago, listing:)
    end

    it { is_expected.to eq true }
  end
end
