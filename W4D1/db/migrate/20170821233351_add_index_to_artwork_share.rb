class AddIndexToArtworkShare < ActiveRecord::Migration[5.1]
  def change
    add_index :artworks_shares, :artwork_id, unique: true
    add_index :artworks_shares, :viewer_id, unique: true
  end
end
