class AddComplementToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :complement, :string
  end
end
