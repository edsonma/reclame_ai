class CreateLocales < ActiveRecord::Migration[5.2]
  def change
    create_table :locales do |t|
      t.float :latitude
      t.float :longitude
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end
