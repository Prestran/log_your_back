class CreateBacklogs < ActiveRecord::Migration[7.1]
  def change
    create_table :backlogs do |t|
      t.string :title, null: false, index: true
      t.string :type, null: false
      t.date :due_at, null: false
      t.timestamps
    end
  end
end
