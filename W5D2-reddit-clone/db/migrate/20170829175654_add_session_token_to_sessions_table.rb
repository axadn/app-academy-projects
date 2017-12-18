class AddSessionTokenToSessionsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :sessions, :token, :integer, null: false
    add_index :sessions, :token, unique: true
  end
end
