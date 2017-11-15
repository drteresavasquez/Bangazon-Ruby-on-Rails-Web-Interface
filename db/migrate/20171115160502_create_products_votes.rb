class CreateProductsVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :products_votes do |t|
      t.integer :product_id
      t.integer :customer_id
      t.integer :status

      t.timestamps
    end
  end
end
