class ListingBlueprint < Blueprinter::Base
  fields(
    :id,
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
  association :applications, blueprint: ApplicationBlueprint
end
