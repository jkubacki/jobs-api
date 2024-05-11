class Api::V1::JobsController < Api::V1::BaseController
  def index
    jobs = Job.all

    render json: JobBlueprint.render(jobs), status: :ok
  end
end
