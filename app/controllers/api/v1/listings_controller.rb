class Api::V1::ListingsController < Api::V1::BaseController
  def index
    search = Listing.search(params[:query] || "*", page: params[:page] || 1, per_page: 10)

    metadata = {
      total: search.total_count,
      page: search.current_page,
      from: search.offset_value,
      to: search.offset_value + search.limit_value
    }

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
