class CreateBacklogEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :backlog_entries do |t|
      t.string :title, null: false
      t.integer :score
      t.string :status
      t.string :backlog_id
      t.timestamps
    end
  end
end
