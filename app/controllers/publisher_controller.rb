class PublisherController < ApplicationController
  def shops
    publisher = Publisher.find(params[:id])
    shops = ShopsQuery.all_shops_ordered_by_sold_count(publisher)
    books_with_amount = BooksQuery.with_amount_for_publisher(publisher)

    render(
      status: :ok,
      json: {
          publisher: publisher,
          shops: shops,
          books: books_with_amount
      },
      serializer: PublisherShopsSerializer
    )
  end
end
