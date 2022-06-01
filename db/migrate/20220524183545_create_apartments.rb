class CreateApartments < ActiveRecord::Migration[6.0]
  def change
    create_table :apartments do |t|
      t.string :name
      t.integer :price
      t.text :body

      t.timestamps
    end
  end
end
