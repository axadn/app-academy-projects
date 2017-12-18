class CreateArtworks < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.integer :artist_id, null: false
      t.string :image_url, null: false
      t.string :title, null: false
    end
    add_index :artworks, [:artist_id, :title],
      unique: true
  end
end
