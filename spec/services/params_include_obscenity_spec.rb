require "rails_helper"

RSpec.describe ParamsIncludeObscenity do
  subject { described_class.call(params:) }

  context "when params include obscenity" do
    let(:params) do
      {
        id: "1",
        listing: {
          title: "Ruby on Rails Developer",
          notes: "This is shit"
        }
      }
    end

    it { is_expected.to eq true }
  end

  context "when params don't include obscenity" do
    let(:params) do
      {
        id: "1",
        listing: {
          title: "Ruby on Rails Developer",
          notes: "This is cool"
        }
      }
    end

    it { is_expected.to eq false }
  end
end
