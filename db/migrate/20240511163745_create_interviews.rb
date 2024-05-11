class CreateInterviews < ActiveRecord::Migration[7.1]
  def change # rubocop:disable Metrics/MethodLength
    create_table :interviews do |t|
      t.belongs_to :application, null: false, foreign_key: true
      t.datetime :date, null: false
      t.string :medium, null: false
      t.text :notes
      t.integer :preference, null: false, unsigned: true, limit: 1

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL.squish
          ALTER TABLE interviews
          ADD CONSTRAINT interviews_preference_range
          CHECK (preference BETWEEN 1 AND 100)
        SQL
      end
    end
  end
end
