class CreateProvinces < ActiveRecord::Migration[6.1]
  def change
    create_table :provinces do |t|
      t.string :abbrev
      t.string :name
      t.decimal :PST
      t.decimal :HST

      t.timestamps
    end
  end
end
