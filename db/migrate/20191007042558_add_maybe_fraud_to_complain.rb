class AddMaybeFraudToComplain < ActiveRecord::Migration[5.2]
  def change
    add_column :complains, :maybe_fraud, :string
  end
end
