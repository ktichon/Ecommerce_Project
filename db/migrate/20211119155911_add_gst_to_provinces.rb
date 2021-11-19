class AddGstToProvinces < ActiveRecord::Migration[6.1]
  def change
    add_column :provinces, :GST, :decimal
    add_column :orders, :PST, :decimal
  end
end
