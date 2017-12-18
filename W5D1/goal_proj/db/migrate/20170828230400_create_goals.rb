class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.text :body, null: false
      t.integer :user_id, null: false
      t.boolean :public, null: false, default: false
      t.boolean :completed, null: false, default: false
      t.timestamps
    end
    add_index :goals, :user_id
  end
end
