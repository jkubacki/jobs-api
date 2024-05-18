class CreateApplications < ActiveRecord::Migration[7.1]
  def change # rubocop:disable Metrics/MethodLength
    create_table :applications do |t|
      t.belongs_to :listing, null: false, foreign_key: true
      t.date :applied_at, null: false
      t.boolean :cv, null: false, default: false
      t.text :cover_letter
      t.text :notes
      t.integer :preference, null: false, unsigned: true, limit: 1

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL.squish
          ALTER TABLE applications
          ADD CONSTRAINT applications_preference_range
          CHECK (preference BETWEEN 1 AND 100)
        SQL
      end
    end
  end
end
