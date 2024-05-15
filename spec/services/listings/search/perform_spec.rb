require "rails_helper"
# rubocop:disable RSpec/MultipleMemoizedHelpers
RSpec.describe Listings::Search::Perform, type: :service do
  subject { described_class.call(query:, page:, remote:, per_page:) }

  let(:query) { "" }
  let(:page) { "" }
  let(:remote) { "" }
  let(:per_page) { 3 }

  let!(:onsite_ruby_title_listing) { create(:listing, remote: false, title: "Ruby on Rails Developer") }
  let!(:remote_listing) { create(:listing, remote: true) }
  let!(:onsite_ruby_stack_listing) { create(:listing, remote: false, stack: "Ruby, Typescript") }

  before { Listing.reindex }

  context "when all parameters are empty" do
    let(:per_page) { 2 }

    it "returns first page of the newest listings" do
      expect(subject.value!.results).to eq [onsite_ruby_stack_listing, remote_listing]
    end
  end

  context "when page is set" do
    let(:page) { 2 }
    let(:per_page) { 2 }

    it "returns the second page of newest listings" do
      expect(subject.value!.results).to eq [onsite_ruby_title_listing]
    end
  end

  context 'when remote is set to "true"' do
    let(:remote) { "true" }

    it "returns only remote listings" do
      expect(subject.value!.results).to eq [remote_listing]
    end
  end

  context 'when remote is set to "false"' do
    let(:remote) { "false" }

    it "returns only on site listings" do
      expect(subject.value!.results).to eq [onsite_ruby_stack_listing, onsite_ruby_title_listing]
    end
  end

  context "when query is set" do
    let(:query) { "ruby" }

    it "returns only listings that match the query" do
      expect(subject.value!.results).to eq [onsite_ruby_stack_listing, onsite_ruby_title_listing]
    end
  end

  context "when query raises an elastic search error" do
    before do
      allow(Listing).to receive(:search).and_raise(Elastic::Transport::Transport::Error)
    end

    it "returns a failure" do
      expect(subject.failure).to be_a(Elastic::Transport::Transport::Error)
    end
  end
end
# rubocop:enable RSpec/MultipleMemoizedHelpers
