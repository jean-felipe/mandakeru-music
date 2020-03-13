class CreateArtistsLineUps < ActiveRecord::Migration[6.0]
  def change
    drop_table :line_up_artists

    create_table :artists_line_ups do |t|
      t.references :artist, null: false, foreign_key: true, index: true
      t.references :line_up, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
