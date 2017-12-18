class ChangeTokenTypeToString < ActiveRecord::Migration[5.1]
  def change
    remove_column :sessions, :token
    add_column :sessions, :token, :string, null: false
    add_index :sessions, :token, unique: true
  end
end
