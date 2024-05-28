class Api::V1::RepliesController < Api::V1::BaseController
  before_action :filter_obscenity, only: :create

  def create
    reply = Reply.new(replies_params)

    if reply.save
      render json: ReplyBlueprint.render(reply), status: :created
    else
      render json: { message: reply.errors.full_messages.join(", ") }, status: :unprocessable_entity
    end
  end

  def destroy
    reply = Reply.find(params[:id])

    if reply.destroy
      render json: {}, status: :ok
    else
      render json: { message: "Couldn't delete a reply" }, status: :unprocessable_entity
    end
  end

  private

  def replies_params
    params.require(:reply).permit(
      :application_id,
      :sent_at,
      :by_me,
      :rejected,
      :body,
      :notes,
      :preference
    )
  end
end
