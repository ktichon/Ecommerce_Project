class CartController < ApplicationController

  def create
    book_id = params[:id]
    book_quantity = params[:amount].to_i
    newItem = true
    if !session[:shopping_cart].key?(book_id)
      session[:shopping_cart][book_id] = book_quantity
    else
      Rails.logger.debug("Book Amount Param: #{params[:amount][0]}")

      session[:shopping_cart][book_id] += book_quantity
    end

    # if session[:shopping_cart].any? {|book| book['id'] == book_id}
    #   book[:amount] += book_quantity
    # else
    #   session[:shopping_cart] << { :id => book_id, :amount => book_quantity}
    # end

    # session[:shopping_cart].each do | item|
    #   if item['id'] == book_id
    #     newItem = false
    #     item['amount'] += book_quantity
    #   end
    # end


    redirect_back fallback_location: root_path
  end

  def destroy

  end
end
