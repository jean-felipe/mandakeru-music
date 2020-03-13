class CreateEventArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :event_artists do |t|
      t.references :event, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end

     add_index :event_artists, [:event_id, :artist_id]
  end
end
