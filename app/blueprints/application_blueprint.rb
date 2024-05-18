class ApplicationBlueprint < Blueprinter::Base
  fields :id, :listing_id, :applied_at, :cv, :cover_letter, :notes, :preference
  association :replies, blueprint: ReplyBlueprint
end
