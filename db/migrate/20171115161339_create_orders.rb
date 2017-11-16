class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :payment_type_id
      t.boolean :active

      t.timestamps
    end
  end
end
