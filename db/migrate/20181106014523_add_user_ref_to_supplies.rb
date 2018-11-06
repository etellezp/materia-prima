class AddUserRefToSupplies < ActiveRecord::Migration[5.1]
  def change
    add_reference :supplies, :user, foreign_key: true
  end
end
