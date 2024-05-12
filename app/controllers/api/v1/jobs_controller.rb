class Api::V1::JobsController < Api::V1::BaseController
  def index
    jobs = Job.all

    render json: JobBlueprint.render(jobs), status: :ok
  end

  def create
    job = Job.new(job_params)

    if job.save
      render json: JobBlueprint.render(job), status: :created
    else
      render json: { errors: job.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def job_params # rubocop:disable Metrics/MethodLength
    params.require(:job).permit(
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
