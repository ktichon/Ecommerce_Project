class CheckoutController < ApplicationController
  def create
    province = Province.find(params[:province_id])
    customer = province.customers.create(address: params[:address], postal_code: params[:postal], email: params[:email])
    if customer.invalid?
      flash[:notice] = "Please ensure that all fields are vaild"
      redirect_back fallback_location: root_path
      return
    end
    total_after_tax = cart[0] + cart[0] * province.PST + cart[0] * province.GST + cart[0] * province.HST
    order = customer.orders.create(status: "New", PST: province.PST, GST: province.GST, HST: province.HST, total: total_after_tax)
    cart[1].each do |bookInCart|
      BookInOrder.create(order: order, book: bookInCart[0], sold_price: bookInCart[0].cost, amount: bookInCart[1])
    end
    # respond_to do |format|
    #   format.js
    # end
    redirect_back fallback_location: root_path

    #connects to strip

    #redirect to strip payment
  end

  def succes
    #got money
  end

  def cancel
    #error

  end
end
