class Api::V1::ListingsController < Api::V1::BaseController
  def index
    result = Listings::Search::Perform.call(query: params[:query], page: params[:page], remote: params[:remote])

    if result.failure?
      render json: { message: "Couldn't perform search" }, status: :unprocessable_entity
      return
    end

    search = result.value!
    metadata = Listings::Search::Metadata.call(search:)

    render json: { listings: ListingBlueprint.render_as_hash(search.results), metadata: }, status: :ok
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
