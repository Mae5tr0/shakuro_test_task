class ShopController < ApplicationController
  def sold_out
    publisher = Shop.find(params[:id])

    render json: publisher, status: :ok
  end
end
