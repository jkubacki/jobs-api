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

  describe "POST create" do
    before { allow(ParamsIncludeObscenity).to receive(:call).and_return(params_include_obscenity) }

    let(:params_include_obscenity) { false }

    let(:params) do
      {
        listing: {
          company: Faker::Company.name,
          url: Faker::Internet.url,
          title: Faker::Job.title,
          description: Faker::Company.bs,
          product: Faker::Company.industry,
          based_in: Faker::Address.full_address,
          timezones: Faker::Address.time_zone,
          stack: Faker::ProgrammingLanguage.name,
          compensation: "$250k-$300k",
          pto: "14 days",
          remote: true,
          glassdoor_url: Faker::Internet.url,
          glassdoor_rating: 45,
          notes: "These are my notes",
          preference:
        }
      }
    end

    let(:preference) { 50 }

    context "with valid params" do
      it "returns created" do
        post(:create, params:)
        expect(response).to have_http_status(:created)
      end

      it "creates a listing" do
        expect { post(:create, params:) }.to change(Listing, :count).by(1)
      end

      it "renders created listing" do
        post(:create, params:)

        expect(response.body).to eq(
          ListingBlueprint.render(Listing.last)
        )
      end
    end

    context "with valid params including obscenity" do
      let(:params_include_obscenity) { true }

      it "returns unprocessable_entity" do
        post(:create, params:)
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "doesn't create a listing" do
        expect { post(:create, params:) }.not_to change(Listing, :count)
      end

      it "renders errors" do
        post(:create, params:)

        expect(response.body).to eq({ message: "Plase, don't use obscenity." }.to_json)
      end
    end

    context "with invalid params" do
      let(:preference) { 101 }

      it "returns unprocessable_entity" do
        post(:create, params:)
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "doesn't create a listing" do
        expect { post(:create, params:) }.not_to change(Listing, :count)
      end

      it "renders errors" do
        post(:create, params:)

        expect(response.body).to eq({ message: "Preference must be less than or equal to 100" }.to_json)
      end
    end
  end

  describe "PUTS update" do
    before { allow(ParamsIncludeObscenity).to receive(:call).and_return(params_include_obscenity) }

    let(:params_include_obscenity) { false }
    let(:params) do
      {
        id:,
        listing: {
          company: "Updated Company Name",
          preference:
        }
      }
    end
    let(:preference) { 50 }

    context "when listing is found" do
      let(:id) { 0 }

      it "returns not found" do
        put(:update, params:)
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when listing exists" do
      let!(:listing) { create(:listing) }
      let(:id) { listing.id }

      context "with valid params" do # rubocop:disable RSpec/NestedGroups
        it "returns ok" do
          put(:update, params:)
          expect(response).to have_http_status(:ok)
        end

        it "updates a listing" do
          put(:update, params:)

          expect(listing.reload.company).to eq "Updated Company Name"
        end
      end

      context "with valid params including obscenity" do # rubocop:disable RSpec/NestedGroups
        let(:params_include_obscenity) { true }

        it "returns unprocessable_entity" do
          put(:update, params:)
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "doesn't update a listing" do
          put(:update, params:)

          expect(listing.reload.company).not_to eq "Updated Company Name"
        end

        it "renders errors" do
          put(:update, params:)

          expect(response.body).to eq({ message: "Plase, don't use obscenity." }.to_json)
        end
      end

      context "with invalid params" do # rubocop:disable RSpec/NestedGroups
        let(:preference) { 101 }

        it "returns unprocessable_entity" do
          put(:update, params:)
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "doesn't update a listing" do
          put(:update, params:)

          expect(listing.reload.preference).not_to eq 101
        end

        it "renders errors" do
          put(:update, params:)

          expect(response.body).to eq({ message: "Preference must be less than or equal to 100" }.to_json)
        end
      end
    end
  end
end
