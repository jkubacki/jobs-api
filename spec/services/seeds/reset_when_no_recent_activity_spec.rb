require "rails_helper"

RSpec.describe Seeds::ResetWhenNoRecentActivity do
  subject { described_class.call(since:) }

  let(:since) { 1.day.ago }

  before do
    allow(Seeds::NoRecentActivity).to receive(:call).with(since:).and_return(no_recent_activity)
    allow(Seeds::AnyChanges).to receive(:call).and_return(any_changes)
    allow(Seeds::Reset).to receive(:call)
  end

  context "when there is no recent activity and there are changes" do
    let(:no_recent_activity) { true }
    let(:any_changes) { true }

    it "resets the seeds" do
      subject
      expect(Seeds::Reset).to have_received(:call)
    end

    it { is_expected.to be_success }

    it "returns true" do
      expect(subject.value!).to eq true
    end
  end

  shared_examples "doesn't reset seeds and returns success with false" do
    it "doesn't reset the seeds" do
      subject
      expect(Seeds::Reset).not_to have_received(:call)
    end

    it { is_expected.to be_success }

    it "returns false" do
      expect(subject.value!).to eq false
    end
  end

  context "when there there are changes but there is recent activity" do
    let(:no_recent_activity) { false }
    let(:any_changes) { true }

    it_behaves_like "doesn't reset seeds and returns success with false"
  end

  context "when there is no recent activity but there are no changes" do
    let(:no_recent_activity) { true }
    let(:any_changes) { false }

    it_behaves_like "doesn't reset seeds and returns success with false"
  end
end
