require "rails_helper"

RSpec.describe Api::V1::RepliesController do
  include Dry::Monads::Result::Mixin

  describe "POST create" do
    before { allow(ParamsIncludeObscenity).to receive(:call).and_return(params_include_obscenity) }

    let(:params_include_obscenity) { false }

    let(:params) do
      {
        reply: {
          application_id:,
          sent_at: Faker::Date.in_date_period,
          by_me: Faker::Boolean.boolean,
          rejected: Faker::Boolean.boolean,
          body: Faker::Lorem.paragraph,
          notes: Faker::Lorem.paragraph,
          preference: Faker::Number.within(range: 1..100)
        }
      }
    end
    let(:application_id) { 0 }
    let(:preference) { 50 }

    context "with valid params" do
      let(:application_id) { create(:application).id }

      it "returns created" do
        post(:create, params:)
        expect(response).to have_http_status(:created)
      end

      it "creates an reply" do
        expect { post(:create, params:) }.to change(Reply, :count).by(1)
      end

      it "renders created reply" do
        post(:create, params:)

        expect(response.body).to eq(
          ReplyBlueprint.render(Reply.last)
        )
      end
    end

    context "with valid params including obscenity" do
      let(:application_id) { create(:application).id }
      let(:params_include_obscenity) { true }

      it "returns unprocessable_entity" do
        post(:create, params:)
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "doesn't create an reply" do
        expect { post(:create, params:) }.not_to change(Reply, :count)
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

      it "doesn't create an reply" do
        expect { post(:create, params:) }.not_to change(Reply, :count)
      end

      it "renders errors" do
        post(:create, params:)

        expect(response.body).to eq({ message: "Application must exist" }.to_json)
      end
    end
  end

  describe "DELETE destroy" do
    context "when reply is not found" do
      it "returns not found" do
        delete(:destroy, params: { id: 0 })
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when reply exists" do
      let!(:reply) { create(:reply) }
      let(:id) { reply.id }

      it "returns ok" do
        delete(:destroy, params: { id: })
        expect(response).to have_http_status(:ok)
      end

      it "deletes a reply" do
        expect { delete(:destroy, params: { id: }) }.to change(Reply, :count).by(-1)
      end
    end
  end
end
