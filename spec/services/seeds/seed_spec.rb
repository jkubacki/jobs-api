require "rails_helper"

RSpec.describe Seeds::Seed do
  subject { described_class.call }

  it "creates records" do # rubocop:disable RSpec/ExampleLength
    expect { subject }.to(
      change(Listing, :count).by(13)
      .and(change(Application, :count).by(4))
      .and(change(Reply, :count).by(11))
      .and(change(Interview, :count).by(1))
      .and(change(Offer, :count).by(2))
    )
  end
end
