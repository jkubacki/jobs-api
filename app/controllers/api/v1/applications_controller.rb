class Api::V1::ApplicationsController < Api::V1::BaseController
  def index
    result = Applications::Search::Perform.call(query: params[:query], page: params[:page], remote: params[:remote])

    if result.failure?
      render json: { message: "Couldn't perform search" }, status: :unprocessable_entity
      return
    end

    search = result.value!
    metadata = Applications::Search::Metadata.call(search:)

    render json: { applications: ApplicationBlueprint.render_as_hash(search.results), metadata: }, status: :ok
  end

  def create
    application = Application.new(application_params)

    if application.save
      render json: ApplicationBlueprint.render(application), status: :created
    else
      render json: { message: application.errors.full_messages.join(", ") }, status: :unprocessable_entity
    end
  end

  def update
    application = Application.find(params[:id])

    if application.update(application_params)
      render json: ApplicationBlueprint.render(application), status: :ok
    else
      render json: { message: application.errors.full_messages.join(", ") }, status: :unprocessable_entity
    end
  end

  def destroy
    application = Application.find(params[:id])

    if application.destroy
      render json: {}, status: :ok
    else
      render json: { message: "Couldn't delete a application" }, status: :unprocessable_entity
    end
  end

  private

  def application_params
    params.require(:application).permit(
      :listing_id,
      :applied_at,
      :cv,
      :cover_letter,
      :notes,
      :preference
    )
  end
end
