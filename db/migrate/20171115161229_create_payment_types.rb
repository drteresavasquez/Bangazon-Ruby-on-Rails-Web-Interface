class CreatePaymentTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_types do |t|
      t.integer :user_id
      t.string :account_name
      t.integer :account_number
      t.date :exp_date

      t.timestamps
    end
  end
end
