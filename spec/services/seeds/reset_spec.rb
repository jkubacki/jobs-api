require "rails_helper"

RSpec.describe Seeds::Reset do
  subject { described_class.call }

  let!(:old_listing) { create(:listing) }

  context "when seeding throws an error" do
    before do
      allow(Seeds::Seed).to receive(:call).and_raise(StandardError)
    end

    it "doesn't delete old listings" do
      expect(old_listing.reload).to be_present
    end
  end

  context "when seeding is successful" do
    before do
      allow(Seeds::Seed).to receive(:call)
    end

    it "deletes old listings" do
      subject
      expect { old_listing.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
