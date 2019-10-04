class CreateComplains < ActiveRecord::Migration[5.2]
  def change
    create_table :complains do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.numeric :order
      t.integer :shipping_zipcode
      t.text :description
      t.belongs_to :locale, foreign_key: true

      t.timestamps
    end
  end
end
