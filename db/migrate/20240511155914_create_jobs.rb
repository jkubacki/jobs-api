class CreateJobs < ActiveRecord::Migration[7.1]
  def change # rubocop:disable Metrics/MethodLength
    create_table :jobs do |t|
      t.string :company, null: false
      t.string :url, null: false
      t.string :title, null: false
      t.text :description
      t.string :product, null: false
      t.string :based_in, null: false
      t.string :timezones
      t.text :stack, null: false
      t.text :compensation, null: false
      t.text :pto
      t.string :glassdoor_url
      t.integer :glassdoor_rating
      t.text :notes
      t.integer :preference, null: false

      t.timestamps
    end
  end
end
