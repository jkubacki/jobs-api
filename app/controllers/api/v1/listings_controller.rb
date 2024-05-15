class Api::V1::ListingsController < Api::V1::BaseController
  def index
    pagy, records = pagy(Listing.order(id: :desc), items: 10, page: params[:page] || 1)

    metadata = {
      total: pagy.count,
      page: pagy.page,
      from: pagy.from,
      to: pagy.to
    }

    render json: { listings: ListingBlueprint.render_as_hash(records), metadata: }, status: :ok
  end

  def create
    listing = Listing.new(listing_params)

    if listing.save
      render json: ListingBlueprint.render(listing), status: :created
    else
      render json: { message: listing.errors.full_messages.join(", ") }, status: :unprocessable_entity
    end
  end

  private

  def listing_params # rubocop:disable Metrics/MethodLength
    params.require(:listing).permit(
      :company,
      :url,
      :title,
      :description,
      :product,
      :based_in,
      :timezones,
      :stack,
      :compensation,
      :pto,
      :remote,
      :glassdoor_url,
      :glassdoor_rating,
      :notes,
      :preference
    )
  end
end
