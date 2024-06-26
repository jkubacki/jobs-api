class CreateTasks < ActiveRecord::Migration[7.1]
  def change # rubocop:disable Metrics/MethodLength
    create_table :tasks do |t|
      t.belongs_to :reply, null: false, foreign_key: true
      t.datetime :due_at
      t.boolean :done, null: false, default: false
      t.text :notes
      t.integer :preference, null: false, unsigned: true, limit: 1

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL.squish
          ALTER TABLE tasks
          ADD CONSTRAINT tasks_preference_range
          CHECK (preference BETWEEN 0 AND 100)
        SQL
      end
    end
  end
end
