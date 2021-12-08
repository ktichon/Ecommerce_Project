ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :status, :GST, :HST, :total, :customer_id, :PST, book_in_orders_attributes: [:id, :order_id, :book_id, :amount, :sold_price, :_destroy]

  show do | order|
    attributes_table do
      row :status
      row :customer

      table_for order.book_in_orders do
        column "Products" do |product|
          product.book.name
        end
        column "Quantity" do |product|
          product.amount
        end
        column "Per Unit Price" do |product|
          product.sold_price
        end
      end

      row :PST
      row :GST
      row :HST
      row :total
    end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:status, :GST, :HST, :total, :customer_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
