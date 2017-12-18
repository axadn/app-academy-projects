class AddEnvToSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :sessions, :env, :string, null: false
  end
end
