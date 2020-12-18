class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :author, null: false, foreign_key: true
      t.string :name
      t.integer :amount

      t.timestamps
    end
    add_foreign_key :tasks, :users, column: :author_id
  end
end
