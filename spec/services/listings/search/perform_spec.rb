require "rails_helper"
# rubocop:disable RSpec/MultipleMemoizedHelpers
RSpec.describe Listings::Search::Perform do
  subject { described_class.call(query:, page:, remote:, per_page:, status:) }

  let(:query) { "" }
  let(:page) { "" }
  let(:remote) { "" }
  let(:per_page) { 10 }
  let(:status) { nil }

  let!(:onsite_ruby_title_listing) { create(:listing, remote: false, title: "Ruby on Rails Developer") }
  let!(:rejected_onsite_ruby_title_listing) do
    create(:listing, :rejected, remote: false, title: "Rejected Ruby on Rails Developer")
  end

  let!(:remote_listing) { create(:listing, remote: true) }
  let!(:rejected_remote_listing) { create(:listing, :rejected, remote: true) }

  let!(:onsite_ruby_stack_listing) { create(:listing, remote: false, stack: "Ruby, Typescript") }
  let!(:rejected_onsite_ruby_stack_listing) do
    create(:listing, :rejected, remote: false, stack: "Ruby, Typescript")
  end

  before do
    Listing.reindex
  end

  context "when all parameters are empty" do
    let(:per_page) { 2 }

    it "returns first page of last updated listings" do
      expect(subject.value!.results).to eq [rejected_onsite_ruby_stack_listing, onsite_ruby_stack_listing]
    end

    context "when listing created first is updated last" do
      before do
        onsite_ruby_stack_listing.update(title: "Ruby on Rails Developer")
        Listing.reindex
      end

      it "returns first page of last updated listings" do
        expect(subject.value!.results).to eq [onsite_ruby_stack_listing, rejected_onsite_ruby_stack_listing]
      end
    end

    context "with status param" do
      let(:status) { "rejected" }

      it "returns first page of all last updated listings with status" do
        expect(subject.value!.results).to eq [rejected_onsite_ruby_stack_listing, rejected_remote_listing]
      end
    end
  end

  context "when page is set" do
    let(:page) { 2 }
    let(:per_page) { 2 }

    it "returns the second page of last updated listings" do
      expect(subject.value!.results).to eq [rejected_remote_listing, remote_listing]
    end

    context "with status param" do
      let(:status) { "rejected" }

      it "returns the second page of all last updated listings with status" do
        expect(subject.value!.results).to eq [rejected_onsite_ruby_title_listing]
      end
    end
  end

  context 'when remote is set to "true"' do
    let(:remote) { "true" }

    it "returns remote listings" do
      expect(subject.value!.results).to eq [rejected_remote_listing, remote_listing]
    end

    context "with status param" do
      let(:status) { "rejected" }

      it "returns all remote listings with status" do
        expect(subject.value!.results).to eq [rejected_remote_listing]
      end
    end
  end

  context 'when remote is set to "false"' do
    let(:remote) { "false" }

    it "returns on site listings" do
      expect(subject.value!.results).to eq [rejected_onsite_ruby_stack_listing, onsite_ruby_stack_listing,
                                            rejected_onsite_ruby_title_listing, onsite_ruby_title_listing]
    end

    context "with status param" do
      let(:status) { "rejected" }

      it "returns on site listings with status" do
        expect(subject.value!.results).to eq [rejected_onsite_ruby_stack_listing, rejected_onsite_ruby_title_listing]
      end
    end
  end

  context "when query is set" do
    let(:query) { "ruby" }

    it "returns listings that match the query" do
      expect(subject.value!.results).to eq [rejected_onsite_ruby_stack_listing, onsite_ruby_stack_listing,
                                            rejected_onsite_ruby_title_listing, onsite_ruby_title_listing]
    end

    context "with status param" do
      let(:status) { "rejected" }

      it "returns listings that match the query with status" do
        expect(subject.value!.results).to eq [rejected_onsite_ruby_stack_listing, rejected_onsite_ruby_title_listing]
      end
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
