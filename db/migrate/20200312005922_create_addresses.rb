class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.integer :number, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zipcode, null: false
      t.string :neighborhood, null: false
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
