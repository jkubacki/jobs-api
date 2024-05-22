class Api::V1::ApplicationsController < Api::V1::BaseController
  def create
    if ParamsIncludeObscenity.call(params: application_params)
      render json: { message: "Plase, don't use obscenity." }, status: :unprocessable_entity
      return
    end
    application = Application.new(application_params)

    if application.save
      render json: ApplicationBlueprint.render(application), status: :created
    else
      render json: { message: application.errors.full_messages.join(", ") }, status: :unprocessable_entity
    end
  end

  def update
    if ParamsIncludeObscenity.call(params: application_params)
      render json: { message: "Plase, don't use obscenity." }, status: :unprocessable_entity
      return
    end
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
