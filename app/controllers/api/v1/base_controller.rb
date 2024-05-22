class Api::V1::BaseController < ApplicationController
  def filter_obscenity
    return unless ParamsIncludeObscenity.call(params:)

    render json: { message: "Plase, don't use obscenity." }, status: :unprocessable_entity
  end
end
