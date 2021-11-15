class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :address
      t.string :postal_code
      t.references :provence, null: false, foreign_key: true

      t.timestamps
    end
  end
end
