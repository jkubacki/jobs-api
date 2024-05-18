class CreateOffers < ActiveRecord::Migration[7.1]
  def change # rubocop:disable Metrics/MethodLength
    create_table :offers do |t|
      t.belongs_to :reply, null: false, foreign_key: true
      t.boolean :by_me, null: false, default: false
      t.text :compensation, null: false
      t.text :pto
      t.text :notes, null: false
      t.integer :preference, null: false, unsigned: true, limit: 1, default: 100
      t.boolean :accepted, null: false, default: false

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL.squish
          ALTER TABLE offers
          ADD CONSTRAINT offers_preference_range
          CHECK (preference BETWEEN 0 AND 100)
        SQL
      end
    end
  end
end
