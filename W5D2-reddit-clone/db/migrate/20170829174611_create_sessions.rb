class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.string :session_info
      t.integer :user_id
      t.timestamps
    end
    add_index :sessions, :user_id
  end
end
