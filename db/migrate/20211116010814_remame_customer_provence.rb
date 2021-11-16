class RemameCustomerProvence < ActiveRecord::Migration[6.1]
  def change
    remove_reference :customers, :provence, index: true, foreign_key: true
    add_reference :customers, :province, index: true, foreign_key: true
  end
end
