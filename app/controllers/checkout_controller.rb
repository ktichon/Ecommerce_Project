class CheckoutController < ApplicationController

  def index
    if current_user
      province = Province.find(current_user.province_id)
      @povince_name = province.name
    end

  end

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
    line_items = []
    cart[1].each do |bookInCart|
      BookInOrder.create(order: order, book: bookInCart[0], sold_price: bookInCart[0].cost, amount: bookInCart[1])
      line_items << {name: bookInCart[0].name, description: bookInCart[0].description, amount:  (bookInCart[0].cost * 100).to_i, quantity: bookInCart[1], currency: "cad" }
    end
    if province.GST > 0
      line_items << {name: "GST", description: "Goods and Services Tax", amount: (cart[0] * province.GST * 100).to_i , quantity: 1, currency: "cad" }
    end
    if province.PST > 0
      line_items << {name: "PST", description: "Provincial Sales Tax", amount: (cart[0] * province.PST * 100).to_i , quantity: 1, currency: "cad" }
    end
    if province.HST > 0
      line_items << {name: "PST", description: "Harmonized Sales Tax", amount: (cart[0] * province.HST * 100).to_i , quantity: 1, currency: "cad" }
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url:          checkout_success_url,
      cancel_url:           checkout_cancel_url,
      line_items:           line_items,
      customer_email:       params[:email]
    )

    respond_to do |format|
      format.js # render app/views/checkout/create.js.erb
    end


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
