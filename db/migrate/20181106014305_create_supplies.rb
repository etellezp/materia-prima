class CreateSupplies < ActiveRecord::Migration[5.1]
  def change
    create_table :supplies do |t|
      t.string :name
      t.float :quantity
      t.decimal :price, precision: 8, scale: 2
      t.string :location

      t.timestamps
    end
  end
end
