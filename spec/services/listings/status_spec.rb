require "rails_helper"

describe Listings::Status do
  subject { described_class.call(listing:) }

  let!(:listing) { create(:listing) }

  before do
    allow(listing).to receive(:reindex)
  end

  context "when listing has no applications" do
    it "returns pending" do
      expect(subject).to eq(described_class::PENDING)
    end
  end

  context "when listing has applications" do
    context "with no replies" do
      before do
        create(:application, listing:)
      end

      it "returns applied" do
        expect(subject).to eq(described_class::APPLIED)
      end
    end

    context "with some rejected replies and some not rejected" do
      before do
        application = create(:application, listing:)
        create(:reply, application:, rejected: false)
        create(:reply, application:, rejected: true)
      end

      it "returns rejected" do
        expect(subject).to eq(described_class::REJECTED)
      end
    end

    context "without any rejected replies" do
      before do
        application = create(:application, listing:)
        create(:reply, application:, rejected: false)
      end

      it "returns in progress" do
        expect(subject).to eq(described_class::ACTIVE)
      end
    end
  end
end
