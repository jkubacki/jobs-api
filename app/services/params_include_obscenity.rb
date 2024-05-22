class ParamsIncludeObscenity < ApplicationService
  def call(params:)
    params.to_h.any? do |_key, value|
      Obscenity.profane?(value.to_s)
    end
  end
end
