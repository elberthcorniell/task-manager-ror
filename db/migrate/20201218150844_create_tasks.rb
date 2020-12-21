class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :author, null: false, index: true
      t.string :name
      t.string :description

      t.timestamps
    end
    add_foreign_key :tasks, :users, column: :author_id
  end
end
