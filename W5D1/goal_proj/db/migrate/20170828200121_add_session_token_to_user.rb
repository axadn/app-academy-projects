class AddSessionTokenToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :session_token, :integer, null: false
    add_index :users, :session_token, unique: true
  end
end
