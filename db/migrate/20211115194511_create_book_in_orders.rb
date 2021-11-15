class CreateBookInOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :book_in_orders do |t|
      t.decimal :sold_price
      t. :amout
      t.string :order
      t.string :references
      t.string :book
      t.string :references

      t.timestamps
    end
  end
end
