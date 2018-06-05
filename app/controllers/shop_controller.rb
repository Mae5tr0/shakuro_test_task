class ShopController < ApplicationController
  def sold_out
    shop = Shop.find(params[:id])
    stock = shop.stock.where(book_id: params[:ids])
    result = stock.update_all(amount: 0)

    render json: { count: result }, status: :ok
  end
end
