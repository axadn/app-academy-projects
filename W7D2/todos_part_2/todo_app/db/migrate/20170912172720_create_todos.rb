class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.text :body, null: false
      t.boolean :done, null: false
      t.string :title, null:false

      t.timestamps
    end
  end
end
