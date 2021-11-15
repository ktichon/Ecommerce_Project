class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :status
      t.decimal :GST
      t.decimal :HST
      t.decimal :total
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
