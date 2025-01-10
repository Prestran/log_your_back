class CreateBacklogs < ActiveRecord::Migration[7.1]
  def change
    create_table :backlogs do |t|
      t.string :name, null: false, index: true
      t.string :backlog_type, null: false
      t.datetime :due_at, null: false
      t.timestamps
    end
  end
end
