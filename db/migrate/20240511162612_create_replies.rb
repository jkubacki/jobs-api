class CreateReplies < ActiveRecord::Migration[7.1]
  def change # rubocop:disable Metrics/MethodLength
    create_table :replies do |t|
      t.belongs_to :application, null: false, foreign_key: true
      t.datetime :sent_at, null: false
      t.boolean :by_me, null: false, default: false
      t.text :body, null: false
      t.text :notes
      t.integer :preference, null: false, unsigned: true, limit: 1, default: 100

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL.squish
          ALTER TABLE replies
          ADD CONSTRAINT replies_preference_range
          CHECK (preference BETWEEN 0 AND 100)
        SQL
      end
    end
  end
end
