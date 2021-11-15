class ChangeDataTypeForFieldname < ActiveRecord::Migration[6.1]
  def change
    change_table :book_in_orders do |t|
      t.change :amount, :integer
    end

  end
end
