class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.integer :product_id
      t.string :picture

      t.timestamps
    end
  end
end
