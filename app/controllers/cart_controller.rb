class CartController < ApplicationController

  def create
    book_id = params[:id]
    book_quantity = params[:amount].to_i
    if !session[:shopping_cart].key?(book_id)
      session[:shopping_cart][book_id] = book_quantity
    else
      session[:shopping_cart][book_id] += book_quantity
    end
    book = Book.find(book_id)
    flash[:notice] = "➖ #{book.name} added to cart."

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

  # DELETE /cart/:id
  def destroy

    id = params[:id]
    session[:shopping_cart].delete(id)
    book = Book.find(id)
    flash[:notice] = "➖ #{book.name} removed from cart."
    redirect_back fallback_location: root_path
  end
end
