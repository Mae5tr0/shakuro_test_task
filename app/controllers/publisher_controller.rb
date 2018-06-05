class PublisherController < ApplicationController
  def shops
    publisher = Publisher.find(params[:id])

    render(
      status: :ok,
      json: publisher,
      serializer: PublisherShopsSerializer,
      include: '**',
      shops: ShopsQuery.all_shops_ordered_by_sold_count(publisher),
      books: BooksQuery.new.with_amount_for_publisher(publisher)
    )
  end
end
