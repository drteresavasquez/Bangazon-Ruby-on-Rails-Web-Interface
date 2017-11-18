class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :seller_id
      t.decimal :price
      t.boolean :local
      t.integer :category_id
      t.datetime :exp_date
      t.text :description
      t.integer :quantity
      t.boolean :active, default: true
      t.string :product_name

      t.timestamps
    end
  end
end
