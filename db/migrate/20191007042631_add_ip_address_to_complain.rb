class AddIpAddressToComplain < ActiveRecord::Migration[5.2]
  def change
    add_column :complains, :ip_address, :string
  end
end
