class CreateArtworkShares < ActiveRecord::Migration[5.1]
  def change
    create_table :artwork_shares do |t|
      t.timestamps
    end
  end
end
