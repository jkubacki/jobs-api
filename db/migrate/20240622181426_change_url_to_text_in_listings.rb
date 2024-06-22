class ChangeUrlToTextInListings < ActiveRecord::Migration[7.1]
  def up
    change_column :listings, :url, :text
  end

  def down
    change_column :listings, :url, :string
  end
end
