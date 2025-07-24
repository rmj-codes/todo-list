class CreateTodoItems < ActiveRecord::Migration[7.2]
  def change
    create_table :todo_items do |t|
      t.string :title
      t.text :description
      t.integer :status

      t.timestamps
    end
  end
end
