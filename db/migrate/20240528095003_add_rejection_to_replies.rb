class AddRejectionToReplies < ActiveRecord::Migration[7.1]
  def change
    add_column :replies, :rejection, :boolean, null: false, default: false
  end
end
