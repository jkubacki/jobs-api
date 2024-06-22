require "rails_helper"

describe Listings::AddDefaults do
  subject { described_class.call(listing:) }

  context "with product" do
    let(:listing) { build(:listing, product: "Product") }

    it "doesn't change product" do
      expect(subject.product).to eq("Product")
    end
  end

  context "without product" do
    let(:listing) { build(:listing, product: "") }

    it "sets product to 'Unknown'" do
      expect(subject.product).to eq("Unknown")
    end
  end

  context "without glassdor_url" do
    let(:listing) { build(:listing, glassdoor_url: "", company: "amazon aws") }

    it "sets glassdoor_url to google search" do
      expect(subject.glassdoor_url).to(
        eq("https://www.glassdoor.com/Search/results.htm?keyword=amazon%20aws")
      )
    end
  end

  context "with glassdor_url" do
    let(:listing) { build(:listing, glassdoor_url: "https://www.glassdoor.com") }

    it "doesn't change glassdoor_url" do
      expect(subject.glassdoor_url).to eq("https://www.glassdoor.com")
    end
  end

  context "without compensation" do
    let(:listing) { build(:listing, compensation: "") }

    it "sets compensation to 'Unknown'" do
      expect(subject.compensation).to eq("Unknown")
    end
  end

  context "with compensation" do
    let(:listing) { build(:listing, compensation: "$100K-$200K") }

    it "doesn't change compensation" do
      expect(subject.compensation).to eq("$100K-$200K")
    end
  end

  context "without based_in" do
    let(:listing) { build(:listing, based_in: "") }

    it "sets based_in to 'USA'" do
      expect(subject.based_in).to eq("USA")
    end
  end

  context "with based_in" do
    let(:listing) { build(:listing, based_in: "Canada") }

    it "doesn't change based_in" do
      expect(subject.based_in).to eq("Canada")
    end
  end

  context "without timezones and without based_in" do
    let(:listing) { build(:listing, timezones: "", based_in: nil) }

    it "sets timezones to based_in" do
      expect(subject.timezones).to eq("USA")
    end
  end

  context "with timezones" do
    let(:listing) { build(:listing, timezones: "US/Pacific") }

    it "doesn't change timezones" do
      expect(subject.timezones).to eq("US/Pacific")
    end
  end

  context "without timezones and with based_in" do
    let(:listing) { build(:listing, timezones: "", based_in: "Canada") }

    it "sets timezones to based_in" do
      expect(subject.timezones).to eq("Canada")
    end
  end

  context "without stack" do
    let(:listing) { build(:listing, stack: "") }

    it "sets stack to 'Rails'" do
      expect(subject.stack).to eq("Rails")
    end
  end

  context "with stack" do
    let(:listing) { build(:listing, stack: "React") }

    it "doesn't change stack" do
      expect(subject.stack).to eq("React")
    end
  end
end
