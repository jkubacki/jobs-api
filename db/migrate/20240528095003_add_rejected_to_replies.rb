class AddRejectedToReplies < ActiveRecord::Migration[7.1]
  def change
    add_column :replies, :rejected, :boolean, null: false, default: false
  end
end
