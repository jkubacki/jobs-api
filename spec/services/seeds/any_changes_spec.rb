require "rails_helper"

RSpec.describe Seeds::AnyChanges do
  subject do
    described_class.call(expected_listings_count: 1, expected_applications_count: 1, expected_replies_count: 1)
  end

  before do
    listing = create(:listing)
    application = create(:application, listing:)
    create(:reply, application:)
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

  context "when there is a new reply" do
    before { create(:reply, application: Application.first) }

    it { is_expected.to eq true }
  end

  context "when reply was deleted" do
    before { Reply.first.destroy }

    it { is_expected.to eq true }
  end

  context "when reply was updated" do
    before { Reply.first.update(notes: "New notes") }

    it { is_expected.to eq true }
  end
end
