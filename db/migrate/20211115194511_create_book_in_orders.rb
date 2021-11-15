class CreateBookInOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :book_in_orders do |t|
      t.decimal :sold_price
      t.decimal :amount
      t.references :order, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.timestamps
    end
  end
end
