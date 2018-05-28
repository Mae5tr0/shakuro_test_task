class PublisherController < ApplicationController
  def shops
    publisher = Publisher.find(params[:id])

    render json: publisher, status: :ok
  end
end
