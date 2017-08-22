class ChangeArtworkShareTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :artworks_shares, :artwork_shares
  end
end
