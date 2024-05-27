require "rails_helper"

RSpec.describe Api::V1::ApplicationsController do
  include Dry::Monads::Result::Mixin

  describe "POST create" do
    before { allow(ParamsIncludeObscenity).to receive(:call).and_return(params_include_obscenity) }

    let(:params_include_obscenity) { false }

    let(:params) do
      {
        application: {
          listing_id:,
          applied_at: Faker::Date.in_date_period,
          cv: Faker::Boolean.boolean,
          cover_letter: Faker::Lorem.paragraph,
          notes: Faker::Lorem.paragraph,
          preference: Faker::Number.within(range: 1..100)
        }
      }
    end
    let(:listing_id) { 0 }
    let(:preference) { 50 }

    context "with valid params" do
      let(:listing_id) { create(:listing).id }

      it "returns created" do
        post(:create, params:)
        expect(response).to have_http_status(:created)
      end

      it "creates an application" do
        expect { post(:create, params:) }.to change(Application, :count).by(1)
      end

      it "renders created application" do
        post(:create, params:)

        expect(response.body).to eq(
          ApplicationBlueprint.render(Application.last)
        )
      end
    end

    context "with valid params including obscenity" do
      let(:listing_id) { create(:listing).id }
      let(:params_include_obscenity) { true }

      it "returns unprocessable_entity" do
        post(:create, params:)
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "doesn't create an application" do
        expect { post(:create, params:) }.not_to change(Application, :count)
      end

      it "renders errors" do
        post(:create, params:)

        expect(response.body).to eq({ message: "Plase, don't use obscenity." }.to_json)
      end
    end

    context "with invalid params" do
      it "returns unprocessable_entity" do
        post(:create, params:)
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "doesn't create an application" do
        expect { post(:create, params:) }.not_to change(Application, :count)
      end

      it "renders errors" do
        post(:create, params:)

        expect(response.body).to eq({ message: "Listing must exist" }.to_json)
      end
    end
  end

  describe "PUTS update" do
    before { allow(ParamsIncludeObscenity).to receive(:call).and_return(params_include_obscenity) }

    let(:params_include_obscenity) { false }
    let(:params) do
      {
        id:,
        application: {
          cover_letter: "Updated Cover Letter",
          preference:
        }
      }
    end
    let(:preference) { 50 }

    context "when application is not found" do
      let(:id) { 0 }

      it "returns not found" do
        put(:update, params:)
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when application exists" do
      let!(:application) { create(:application) }
      let(:id) { application.id }

      context "with valid params" do # rubocop:disable RSpec/NestedGroups
        it "returns ok" do
          put(:update, params:)
          expect(response).to have_http_status(:ok)
        end

        it "updates an application" do
          put(:update, params:)

          expect(application.reload.cover_letter).to eq "Updated Cover Letter"
        end
      end

      context "with valid params including obscenity" do # rubocop:disable RSpec/NestedGroups
        let(:params_include_obscenity) { true }

        it "returns unprocessable_entity" do
          put(:update, params:)
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "doesn't update an application" do
          put(:update, params:)

          expect(application.reload.cover_letter).not_to eq "Updated Cover Letter"
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

        it "doesn't update an application" do
          put(:update, params:)

          expect(application.reload.preference).not_to eq 101
        end

        it "renders errors" do
          put(:update, params:)

          expect(response.body).to eq({ message: "Preference must be less than or equal to 100" }.to_json)
        end
      end
    end
  end

  describe "DELETE destroy" do
    context "when application is not found" do
      it "returns not found" do
        delete(:destroy, params: { id: 0 })
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when application exists" do
      let!(:application) { create(:application) }
      let(:id) { application.id }

      it "returns ok" do
        delete(:destroy, params: { id: })
        expect(response).to have_http_status(:ok)
      end

      it "deletes a application" do
        expect { delete(:destroy, params: { id: }) }.to change(Application, :count).by(-1)
      end
    end
  end
end
