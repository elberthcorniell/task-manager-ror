class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :author, null: false, index: true
      t.references :group, null: true, foreign_key: true
      t.string :name, null: false
      t.string :description, null: true
      t.date :expiring_date, null: true

      t.timestamps
    end
    add_foreign_key :tasks, :users, column: :author_id
  end
end
