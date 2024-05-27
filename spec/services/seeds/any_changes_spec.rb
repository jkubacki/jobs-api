require "rails_helper"

RSpec.describe Seeds::AnyChanges do
  subject { described_class.call(expected_listings_count: 1, expected_applications_count: 1) }

  before do
    listing = create(:listing)
    create(:application, listing:)
  end

  context "when there are no changes" do
    it { is_expected.to eq false }
  end

  context "when there is a new listing" do
    before { create(:listing) }

    it { is_expected.to eq true }
  end

  context "when listing was deleted" do
    before { Listing.first.destroy }

    it { is_expected.to eq true }
  end

  context "when listing was updated" do
    before { Listing.first.update(title: "New title") }

    it { is_expected.to eq true }
  end

  context "when there is a new application" do
    before { create(:application, listing: Listing.first) }

    it { is_expected.to eq true }
  end

  context "when application was deleted" do
    before { Application.first.destroy }

    it { is_expected.to eq true }
  end

  context "when application was updated" do
    before { Application.first.update(notes: "New notes") }

    it { is_expected.to eq true }
  end
end
