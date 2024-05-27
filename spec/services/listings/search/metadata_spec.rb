require "rails_helper"

RSpec.describe Listings::Search::Metadata do
  subject { described_class.call(search:) }

  let(:search) do
    double( # rubocop:disable RSpec/VerifiedDoubles
      total_count:,
      current_page: 1,
      offset_value: 10,
      limit_value: 10
    )
  end

  context "when total_count is higher than offset_value + limit_value" do
    let(:total_count) { 100 }

    it "returns metadata with offset + limit as to" do
      expect(subject).to eq({ total: total_count, page: 1, from: 10, to: 20 })
    end
  end

  context "when total_count is lower than offset_value + limit_value" do
    let(:total_count) { 5 }

    it "returns metadata with total_count as to" do
      expect(subject).to eq({ total: total_count, page: 1, from: 10, to: 5 })
    end
  end
end
