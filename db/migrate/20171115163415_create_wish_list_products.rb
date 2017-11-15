class CreateWishListProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :wish_list_products do |t|
      t.integer :wishlist_id
      t.integer :product_id

      t.timestamps
    end
  end
end
