class Api::V1::BaseController < ApplicationController
  def filter_obscenity
    return unless ParamsIncludeObscenity.call(params:)

    render json: { message: "Plase, don't use obscenity." }, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render json: { message: "Not found" }, status: :not_found
  end
end
