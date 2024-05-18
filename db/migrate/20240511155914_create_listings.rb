class CreateListings < ActiveRecord::Migration[7.1]
  def change # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    create_table :listings do |t|
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
      t.boolean :remote, null: false, default: false
      t.string :glassdoor_url
      t.integer :glassdoor_rating, unsigned: true, limit: 1
      t.text :notes
      t.integer :preference, null: false, unsigned: true, limit: 1

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL.squish
          ALTER TABLE listings
          ADD CONSTRAINT listings_preference_range
          CHECK (preference BETWEEN 0 AND 100)
        SQL
      end
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL.squish
          ALTER TABLE listings
          ADD CONSTRAINT listings_glassdoor_rating_range
          CHECK (glassdoor_rating BETWEEN 1 AND 50)
        SQL
      end
    end
  end
end
