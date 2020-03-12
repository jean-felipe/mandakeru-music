class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.datetime :date, null: false
      t.boolean :private, null: false
      t.integer :event_type, null: false

      t.timestamps
    end
  end
end
