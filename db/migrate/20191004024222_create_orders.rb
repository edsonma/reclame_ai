class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :shipping_address
      t.integer :shipping_zipcode
      t.integer :order_number
      t.text :description
      t.timestamp :order_date
      t.belongs_to :user, foreign_key: true
      t.belongs_to :locale, foreign_key: true

      t.timestamps
    end
  end
end
