class Api::V1::ListingsController < Api::V1::BaseController
  def index
    listings = Listing.all

    render json: ListingBlueprint.render(listings), status: :ok
  end

  def create
    listing = Listing.new(listing_params)

    if listing.save
      render json: ListingBlueprint.render(listing), status: :created
    else
      render json: { errors: listing.errors.full_messages }, status: :unprocessable_entity
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
