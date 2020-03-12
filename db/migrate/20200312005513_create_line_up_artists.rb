class CreateLineUpArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :line_up_artists do |t|
      t.references :line_up, null: false, foreign_key: true, index: true
      t.references :artist, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
