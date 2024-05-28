class ReplyBlueprint < Blueprinter::Base
  fields :id, :application_id, :sent_at, :by_me, :rejection, :body, :notes, :preference
end
