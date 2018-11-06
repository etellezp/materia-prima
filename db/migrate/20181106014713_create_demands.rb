class CreateDemands < ActiveRecord::Migration[5.1]
  def change
    create_table :demands do |t|
      t.string :name
      t.float :quantity
      t.string :location

      t.timestamps
    end
  end
end
