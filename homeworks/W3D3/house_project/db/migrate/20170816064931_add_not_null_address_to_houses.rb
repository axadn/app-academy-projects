class AddNotNullAddressToHouses < ActiveRecord::Migration[5.1]
  def change
    change_column :houses, :address, :string, null: false
  end
end
