class AddTimestampToArtwork < ActiveRecord::Migration[5.1]
  def change
    change_table :artworks do |t|
      t.timestamps
    end
  end
end
