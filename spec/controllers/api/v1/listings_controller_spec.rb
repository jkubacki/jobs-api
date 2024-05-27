require "rails_helper"

RSpec.describe Api::V1::ListingsController do
  include Dry::Monads::Result::Mixin

  describe "GET index" do
    before do
      allow(Listings::Search::Perform).to receive(:call).and_return(search_result)
    end

    context "when search is a failure" do
      let(:search_result) { Failure(nil) }

      it "returns unprocessable entity" do
        get :index
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns a message" do
        get :index
        expect(response.body).to eq({ message: "Couldn't perform search" }.to_json)
      end
    end

    context "when search is a success" do
      before do
        allow(Listings::Search::Metadata).to receive(:call).and_return(metadata)
      end

      let(:search_result) { Success(double(results: listings)) } # rubocop:disable RSpec/VerifiedDoubles
      let(:listings) { [build_stubbed(:listing), build_stubbed(:listing)] }
      let(:metadata) { { total: 10, page: 1, from: 10, to: 5 } }

      it "returns ok" do
        get :index
        expect(response).to have_http_status(:ok)
      end

      it "renders the listings" do
        get :index
        expect(response.body).to eq({ listings: ListingBlueprint.render_as_hash(listings), metadata: }.to_json)
      end
    end
  end
end
